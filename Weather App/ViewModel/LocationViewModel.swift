//
//  LocationViewModel.swift
//  Weather App
//
//  Created by Reza Enayati on 6/25/22.
//

import Foundation
import MapKit

class LocationViewModel: NSObject, ObservableObject {
  
    private let locationManager = CLLocationManager()
    var location: CLLocation? = nil
    var currentLocation: CLLocation!
    
    override init (){
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func getLon() -> String? {
        if let safeLocation = location {
            let myLongitude: String = String(format:"%f", safeLocation.coordinate.longitude)
                return myLongitude
        }else{
            print("Failed to get longitude")
            return nil
        }
    }
    func getLat() -> String? {
        if let safeLocation = location {
            let myLatitude: String = String(format:"%f", safeLocation.coordinate.latitude)
                return myLatitude
        }else{
            print("Failed to get longitude")
            return nil
        }
    }
    func getCityName(){
        
    }


}

//MARK: -  CLLocationManagerDelegate
extension LocationViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        self.location = location
    }
}

//MARK: -  Finding city name
//extension LocationViewModel {
//    func getAddressFromLatLon(pdblLatitude: String, withLongitude pdblLongitude: String) {
//            var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
//        let lat: Double = Double("\(getLat() ?? <#default value#>)")!
//            //21.228124
//            let lon: Double = Double("\(getLon())")!
//            //72.833770
//            let ceo: CLGeocoder = CLGeocoder()
//            center.latitude = lat
//            center.longitude = lon
//
//            let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
//
//
//            ceo.reverseGeocodeLocation(loc, completionHandler:
//                {(placemarks, error) in
//                    if (error != nil)
//                    {
//                        print("reverse geodcode fail: \(error!.localizedDescription)")
//                    }
//                    let pm = placemarks! as [CLPlacemark]
//
//                    if pm.count > 0 {
//                        let pm = placemarks![0]
//                        print(pm.country)
//                        print(pm.locality)
//                        print(pm.subLocality)
//                        var addressString : String = ""
//                        if pm.subLocality != nil {
//                            addressString = addressString + pm.subLocality! + ", "
//                        }
//                        if pm.thoroughfare != nil {
//                            addressString = addressString + pm.thoroughfare! + ", "
//                        }
//                        if pm.locality != nil {
//                            addressString = addressString + pm.locality! + ", "
//                        }
//                        if pm.country != nil {
//                            addressString = addressString + pm.country! + ", "
//                        }
//                        if pm.postalCode != nil {
//                            addressString = addressString + pm.postalCode! + " "
//                        }
//
//
//                        print(addressString)
//                  }
//            })
//
//        }
//}
