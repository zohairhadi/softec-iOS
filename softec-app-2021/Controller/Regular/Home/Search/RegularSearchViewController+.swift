//
//  RegularSearchViewController+.swift
//  softec-app-2021
//
//  Created by Zohair Hadi on 20/06/2021.
//

import UIKit
import GoogleMaps

//MARK:- CLLocationManagerDelegate
extension RegularSearchViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // see nearby locations
        fetchNearbyPlaces()

        // add inital camera position
        screenView.googleMap.camera = GMSCameraPosition(target: CLLocationCoordinate2D(latitude: locationMananger.location?.coordinate.latitude ?? 0.0, longitude: locationMananger.location?.coordinate.longitude ?? 0.0), zoom: 30, bearing: 0, viewingAngle: 0)
        
        // create marker
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: locationMananger.location?.coordinate.latitude ?? 0.0, longitude: locationMananger.location?.coordinate.longitude ?? 0.0)
        marker.title = "Hello Mard"
        marker.snippet = "Masti here"
        marker.map = screenView.googleMap
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager){
        switch manager.authorizationStatus {
        case .authorizedAlways:
            return
        case .denied:
            return
        case .restricted:
            locationMananger.requestWhenInUseAuthorization()
        case .notDetermined:
            locationMananger.requestWhenInUseAuthorization()
        default:
            locationMananger.requestWhenInUseAuthorization()
        }
    }
    
}

// MARK: - GMSMapViewDelegate
extension RegularSearchViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        reverseGeocode(coordinate: position.target)
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoContents marker: GMSMarker) -> UIView? {
      // 1
//      guard let placeMarker = marker as? PlaceMarker else {
//        return nil
//      }
        
      // 2
      let infoView = UIView()
        
////      // 3
////      infoView.nameLabel.text = placeMarker.place.name
//
//      // 4
//      if let photo = placeMarker.place.photo {
//        infoView.placePhoto.image = photo
//      } else {
//        infoView.placePhoto.image = UIImage(named: "generic")
//      }

      return infoView
    }
    
    func mapView(_ mapView: GMSMapView, didTap overlay: GMSOverlay) {
        print("mastiii")
    }

    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
//        marker.icon?.withTintColor()
//        return false

        UserDefaults.standard.setValue(true, forKey: "BusinessViaMap")
        self.present(BusinessCatalogViewController(), animated: true) {
            print("dismissed")
            UserDefaults.standard.setValue(false, forKey: "BusinessViaMap")
        }
        return false
    }
}
