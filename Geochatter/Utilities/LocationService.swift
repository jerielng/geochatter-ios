//
//  LocationService.swift
//  Geochatter
//
//  Created by Jeriel Ng on 5/7/20.
//  Copyright © 2020 Jeriel Ng. All rights reserved.
//

import MapKit

class LocationService {
    static let sharedInstance = LocationService()

    private let locationManager = CLLocationManager()

    private var currentLocation: CLLocation?

    func setLocationDelegate(delegate: CLLocationManagerDelegate) {
        locationManager.delegate = delegate
        self.setUpLocationManager()
    }

    private func setUpLocationManager() {
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }

    func getCurrentLocation() -> CLLocation? {
        return currentLocation
    }

    func updateCurrentLocation(location: CLLocation) {
        currentLocation = location
    }

    func requestPermissions() {
        locationManager.requestWhenInUseAuthorization()
    }
}
