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

    func requestPermissions() {
        locationManager.requestWhenInUseAuthorization()
    }

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

    func isLocationDifferent(newLocation: CLLocation) -> Bool {
        guard let currentLocation = currentLocation else { return true }
        let currentLatitude = roundLocationValue(value: currentLocation.coordinate.latitude)
        let currentLongitude = roundLocationValue(value: currentLocation.coordinate.longitude)
        let newLatitude = roundLocationValue(value: newLocation.coordinate.latitude)
        let newLongitude = roundLocationValue(value: newLocation.coordinate.longitude)
        return currentLatitude != newLatitude && currentLongitude != newLongitude
    }

    func roundLocationValue(value: Double) -> Double {
        return Double(round(10000 * value) / 10000)
    }
}
