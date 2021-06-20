//
//  AppDelegate.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//

import UIKit
import UserNotifications

import GoogleSignIn
import GoogleMaps

import Realm
import Stripe
import StripeTerminal

import Firebase
import FirebaseMessaging

@main
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    let gcmMessageIDKey = "gcmID"

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
      // ...
      if let error = error {
        // ...
        return
      }

      guard let authentication = user.authentication else { return }
      let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                        accessToken: authentication.accessToken)
      // ...
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
      -> Bool {
      return GIDSignIn.sharedInstance().handle(url)
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Terminal.setTokenProvider(APIClient.shared)
        
        // add google maps
        GMSServices.provideAPIKey("AIzaSyBXKx1LAKXjMTOX_Md9kic5xZVONOp7yl8")
        
        // add firebase
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound]) {(granted, error) in
                // Make sure permission to receive push notifications is granted
                print("Permission is granted: \(granted)")
        }
        
        let authCenter = UNUserNotificationCenter.current()
        authCenter.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            // Enable or disable features based on authorization
        }
//        let settings: UIUserNotificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
//        application.registerUserNotificationSettings(settings)
        
        application.registerForRemoteNotifications()
        Messaging.messaging().delegate = self
        
        migratingRealmSchema()
        
        //configuring Stripe
        StripeAPI.defaultPublishableKey = Constants.STRIPE_PUBLIC_KEY
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    
    /**
     RECIEVE AND PARSE PAYLOAD HERE
     */
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        let messageAffinity:String = userInfo[Constants.PAYLOAD_KEY] as? String ?? ""

        // Print full message.
        print(userInfo)
        
        sendNotifications(messageAffinity, userInfo)
        
        completionHandler(UIBackgroundFetchResult.newData)
    }
    
    //handling apns tokens
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
            print("Unable to register for remote notifications: \(error.localizedDescription)")
    }
    
}

//MARK:- Messaging Extension
extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        
        if let fcm = fcmToken {
            print("Firebase registration token: \(String(describing: fcm))")

            let dataDict:[String: String] = ["token": fcm ]
            NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
            
            UserDefaults.standard.setValue(fcmToken, forKey: "FCM_TOKEN")
            // TODO: If necessary send token to application server.
            // Note: This callback is fired at each app startup and whenever a new token is generated.
        }
    }
}

//MARK:- Notification Extension
extension AppDelegate : UNUserNotificationCenterDelegate {

  // Receive displayed notifications for iOS 10 devices.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo

        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
          print("Message ID: \(messageID)")
        }

        // Print full message.
        print(userInfo)
                
        // Change this to your preferred presentation option
        completionHandler([[.alert, .sound]])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        let userInfo = response.notification.request.content.userInfo
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
          print("Message ID: \(messageID)")
        }
        
        let messageAffinity:String = userInfo["messageAffinity"] as? String ?? ""
        
        sendNotifications(messageAffinity, userInfo)
        
        // Print full message.
        print(userInfo)

        completionHandler()
    }
}
