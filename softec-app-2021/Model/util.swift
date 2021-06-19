//
//  util.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 19/06/2021.
//

import Foundation
import RealmSwift
import Firebase

func sendNotifications(_ messageAffinity: String, _ userInfo: [AnyHashable : Any]) {

    if messageAffinity == "addedElderly" {
        _ = userInfo["elderlyId"] as? String ?? ""
//        UserDefaults.standard.setValue(elderlyId, forKey: Constants.USER_DEFAULTS.ELDERLY_ID)
//        NotificationCenter.default.post(name: .CustomElderlyCreated, object: nil)

    }else if messageAffinity == "chatMessage" {
        _ = userInfo["messageEntity"] as! String
//        let realmFeedHandler = RealmFeedDBHandler()
////            var directoryPath = String()
//        var newReminder = Reminder()
//        var newMessage = Message()
//        var mediaData = Data()
//
//        do{
//            newMessage = try JSONDecoder().decode(Message.self, from: message.data(using: .utf8)!)
//
//            //create reminder
//            if newMessage.messageType == MessageType.REMINDER.rawValue {
//                newReminder = Reminder()
//            }
//            else if newMessage.messageType == MessageType.COMPOSED_IMAGE.rawValue ||
//                    newMessage.messageType == MessageType.COMPOSED_VIDEO.rawValue ||
//                    newMessage.messageType == MessageType.IMAGE.rawValue ||
//                    newMessage.messageType == MessageType.VIDEO.rawValue
//            {
//                downloadMediaFromFirebase(mediaURL: newMessage.messageMediaUri!) { (media) in
//                    mediaData = media
//                    realmFeedHandler.saveFeed(newMessage: newMessage, newReminder: newReminder, image: mediaData, directoryPath: "")
//                }
//            }
//            else {
//                realmFeedHandler.saveFeed(newMessage: newMessage, newReminder: newReminder, image: mediaData, directoryPath: "")
//            }
//
//        }catch{
//            print(error)
//        }
    }
}

/**
 *CREATE ALERT
 *@required: title and message
 */
func createAlert(vc: UIViewController, title: String, message: String){
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    vc.present(alert, animated: true)
}

/**
 *UPLOAD PICTURE TO FIREBASE
 *@required: use user data to make path of pic upload
 */
func uploadMediaTofirebase(mediaURL: String, messageID: String, userID: String, composeMediaFlag: MessageType, onCompletion: @escaping (_ downloadURL: URL) -> Void){
    
    // Create a reference to the file you want to upload
    let riverRef = firebaseStorageRef.child(Constants.DEFAULT_STORAGE_PATH + "/" + userID + ".jpg")
    
    let url = URL(string: mediaURL)
    // Start the video storage process
    riverRef.putFile(from: url! as URL, metadata: nil, completion: { (metadata, error) in
        if error == nil {
            print("Successfully uploaded media")
            riverRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    // Uh-oh, an error occurred!
                    return
                }
                onCompletion(downloadURL)
                print("---UPLOAD COMPLETED---")
            }
        } else {
            print(error?.localizedDescription)
        }
    })
}

func downloadMediaFromFirebase(mediaURL: String, onCompletion: @escaping (_ downloadedMedia: Data) -> Void){
    let url = URL(string: mediaURL)!

    DispatchQueue.global().async {
        // Fetch Image Data
        if let data = try? Data(contentsOf: url) {
            DispatchQueue.main.async {
                // Create Image and Update Image View
                onCompletion(data)
            }
        }
    }
}

// migrate realm schemas here
public func migratingRealmSchema(){
    // Inside your application(application:didFinishLaunchingWithOptions:)
     
    let config = Realm.Configuration(
        // Set the new schema version. This must be greater than the previously used
        // version (if you've never set a schema version before, the version is 0).
        schemaVersion: 1,
     
        // Set the block which will be called automatically when opening a Realm with
        // a schema version lower than the one set above
        migrationBlock: { migration, oldSchemaVersion in
            // We haven’t migrated anything yet, so oldSchemaVersion == 0
            if (oldSchemaVersion < 1) {
                // Nothing to do!
                // Realm will automatically detect new properties and removed properties
                // And will update the schema on disk automatically
            }
        })
     
    // Tell Realm to use this new configuration object for the default Realm
    Realm.Configuration.defaultConfiguration = config
     
    // Now that we've told Realm how to handle the schema change, opening the file
    // will automatically perform the migration
    let realm = try! Realm()

}
