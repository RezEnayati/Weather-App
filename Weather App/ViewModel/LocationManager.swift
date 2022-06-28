//
//  LocationViewModel.swift
//  Weather App
//
//  Created by Reza Enayati on 6/25/22.
//

import Foundation
import MapKit

class LocationManager: NSObject, ObservableObject {
  
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation? = nil
    
    override init() {
        super.init()
        locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

//MARK: -  CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        self.location = location
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Could Not Fetch Location")
    }
}


