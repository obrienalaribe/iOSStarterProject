//
//  Locator.swift
//  ChurchFinder
//
//  Created by Obrien Alaribe on 31/01/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import CoreLocation

class Locator: NSObject, CLLocationManagerDelegate {
    
    static let shared: Locator = Locator()
    private var locationManager = CLLocationManager()
    
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
    }
    
    // MARK: - Authorization
    func fetchUserLocation() -> CLLocation? {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        return locationManager.location
    }
   
    func reset() {
        locationManager.stopUpdatingLocation()
    }
    
    // MARK: - Delegate
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("location manager did fail")
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: Array <CLLocation>) {
        print("location manager did update")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == CLAuthorizationStatus.denied) {
            // The user denied authorization
            print("we have seen your location is DISABLED")
        } else if (status == CLAuthorizationStatus.authorizedAlways) {
            // The user accepted authorization
            print("thank you for accepting location ALWAYS")
        }else if (status == CLAuthorizationStatus.authorizedWhenInUse) {
            print("thank you for accepting location WHEN IN USE")
        }
        
    }
    
}
