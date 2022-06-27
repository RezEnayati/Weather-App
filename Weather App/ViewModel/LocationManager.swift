//
//  LocationViewModel.swift
//  Weather App
//
//  Created by Reza Enayati on 6/25/22.
//

import Foundation
import MapKit

class LocationManager: NSObject, ObservableObject {
  
    let locationManager = CLLocationManager()
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading: Bool = false
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocation(){
        isLoading = true
        locationManager.requestLocation()
    }
}


//MARK: -  CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Could Not Fetch Location")
        isLoading = false
    }
}

