//
//  LocationController.swift
//  GraphQLSwiftUI
//
//  Created by TouchToFly on 4/21/20.
//  Copyright © 2020 TouchToFly. All rights reserved.
//

import CoreLocation
import Combine

class LocationController: NSObject, ObservableObject {
    //MARK: Published properties
    @Published var location: CLLocation = CLLocation.init()
    
    @Published var authorization: CLAuthorizationStatus = CLLocationManager.authorizationStatus()
    
    @Published var locationServicesError: Error?
    
    
    //MARK: Other properties
    let manager: CLLocationManager = CLLocationManager.init()
    
    //MARK: Init
    override init() {
        super.init()
        self.manager.delegate = self
        guard CLLocationManager.locationServicesEnabled() == true && self.authorization == .authorizedWhenInUse else {
            return
        }
        self.manager.startMonitoringSignificantLocationChanges()
        self.manager.requestLocation()
    }
    
    
}

extension LocationController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.authorization = status
        guard self.authorization == .authorizedWhenInUse else {
            return
        }
        self.manager.startMonitoringSignificantLocationChanges()
        self.manager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationServicesError = error
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        self.location = location
    }
}
