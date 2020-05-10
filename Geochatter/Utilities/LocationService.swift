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

    func isLocationDifferent(newLocation: CLLocation? = nil, latitude: Double? = nil, longitude: Double? = nil) -> Bool {
        guard let currentLocation = currentLocation else { return true }
        let currentLatitude = FormatterUtils.roundLocationValue(value: currentLocation.coordinate.latitude)
        let currentLongitude = FormatterUtils.roundLocationValue(value: currentLocation.coordinate.longitude)
        var newLatitude: Double = 0
        var newLongitude: Double = 0
        if let latitude = latitude, let longitude = longitude {
            newLatitude = FormatterUtils.roundLocationValue(value: latitude)
            newLongitude = FormatterUtils.roundLocationValue(value: longitude)
        } else if let newLocation = newLocation {
            newLatitude = FormatterUtils.roundLocationValue(value: newLocation.coordinate.latitude)
            newLongitude = FormatterUtils.roundLocationValue(value: newLocation.coordinate.longitude)
        } else {
            return true
        }
        return currentLatitude != newLatitude && currentLongitude != newLongitude
    }
}
