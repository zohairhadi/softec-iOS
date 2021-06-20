//
//  RegularSearchViewController.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//
import UIKit
import GoogleMaps

class RegularSearchViewController: UIViewController {

    //MARK:- Variables and Constants
    var screenView = RegularSearchView()
    let locationMananger = CLLocationManager()
    var locationAddress = String()
    var businessLocations = [CLLocationCoordinate2D()]
    
//    private let dataProvider = GoogleDataProvider()
    private let searchRadius: Double = 1000


    //MARK:- View Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var temp = UserDataModel()
        temp.createUser(user: User(userId: "1", displayName: "Masti", address: "mahool", photoUri: "aa", phoneNumber: "1")) { (isCreate) in
            if isCreate {
                print("created")
            }
        }
        
        configureScreen()
        configureMaps()
        fetchNearbyPlaces()
        hideKeyboardWhenTappedAround()
    }
    
    //MARK:- objc Functions
    @objc func nextButtonPressed(_ sender: UIButton!){
        
    }
    
    //MARK:- Helper Functions
    private func configureScreen(){

        // configure screen
        screenView.configureScreen(view: self.view)
        
        // configure outlets
//        screenView.nextButton.addTarget(self, action: #selector(nextButtonPressed(_:)), for: .touchUpInside)
    }
    
    private func configureMaps(){
        businessLocations.append(CLLocationCoordinate2D(latitude: (locationMananger.location?.coordinate.latitude)! + 0.1, longitude: (locationMananger.location?.coordinate.longitude)! + 0.1))
        businessLocations.append(CLLocationCoordinate2D(latitude: (locationMananger.location?.coordinate.latitude)! + 0.2, longitude: (locationMananger.location?.coordinate.longitude)! + 0.2))
        businessLocations.append(CLLocationCoordinate2D(latitude: (locationMananger.location?.coordinate.latitude)! + 0.3, longitude: (locationMananger.location?.coordinate.longitude)! + 0.3))
        businessLocations.append(CLLocationCoordinate2D(latitude: (locationMananger.location?.coordinate.latitude)! + 0.4, longitude: (locationMananger.location?.coordinate.longitude)! + 0.4))
        
        screenView.googleMap.delegate = self
        locationMananger.delegate = self
        
        if CLLocationManager.locationServicesEnabled(){
            locationMananger.requestLocation()
        } else {
            locationMananger.requestWhenInUseAuthorization()
        }
    }
    
    func reverseGeocode(coordinate: CLLocationCoordinate2D){
        // 1
        let geocoder = GMSGeocoder()
          
        // 2
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            guard let address = response?.firstResult(), let lines = address.lines else {
                return
            }

            // 3
            self.locationAddress = lines.joined(separator: "\n")
            print(self.locationAddress)

            // 4
            UIView.animate(withDuration: 0.25) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func fetchNearbyPlaces() {
        screenView.googleMap.clear()
        for loc in businessLocations {
            let marker = GMSMarker(position: loc)
//            marker.title = "Hello Mard"
//            marker.snippet = "Masti here"
            marker.map = screenView.googleMap
        }
    }
}
