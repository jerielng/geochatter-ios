//
//  MainViewController.swift
//  geochatter
//
//  Created by Jeriel Ng on 12/28/19.
//  Copyright © 2019 Jeriel Ng. All rights reserved.
//

import UIKit
import MapKit

// MARK: - UIViewController
class MainViewController: UIViewController {
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var navBar: UINavigationBar!

    let bubbleManager = BubbleManager.sharedInstance
    let locationService = LocationService.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = GlobalColors.appBackgroundColor
        setUpLocationViewModel()
        setUpMapView()
        setUpTableView()
        setUpNavBar()
    }

    private func setUpLocationViewModel() {
        if CLLocationManager.locationServicesEnabled() {
            self.requestLocationPermissions()
        }
        locationService.setLocationDelegate(delegate: self)
    }

    private func setUpMapView() {
        mapView.showsUserLocation = true
        guard let currentLocation = locationService.getCurrentLocation(),
            let locationDistance = CLLocationDistance(exactly: 8000) else { return }
        let currentRegion = MKCoordinateRegion(center: currentLocation.coordinate,
                                               latitudinalMeters: locationDistance,
                                               longitudinalMeters: locationDistance)
        mapView.setRegion(mapView.regionThatFits(currentRegion), animated: true)
    }

    private func setUpTableView() {
        chatTableView.backgroundColor = GlobalColors.tableViewCellColor
        chatTableView.delegate = self
        chatTableView.dataSource = self
    }

    private func setUpNavBar() {
        guard let navBarItem = navBar.topItem else { return }
        navBar.backgroundColor = GlobalColors.tableViewCellColor
        navBarItem.title = GlobalStrings.mainVCTitle
        navBarItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClicked))
    }

    @IBAction private func addButtonClicked() {
        let bubbleFormVC = BubbleFormViewController()
        self.present(bubbleFormVC, animated: true, completion: nil)
    }
}

extension MainViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first,
            locationService.getCurrentLocation()?.coordinate.latitude != location.coordinate.latitude,
            locationService.getCurrentLocation()?.coordinate.longitude != location.coordinate.longitude else { return }
        locationService.updateCurrentLocation(location: location)
        FirebaseService.sharedInstance.downloadBubbles()
    }

    private func requestLocationPermissions() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationService.requestPermissions()
        case .denied, .restricted:
            present(UIAlertController(title: "Location Permissions Not Allowed",
                                      message: "Please enable location services in system settings to make full use of Geochatter",
                                      preferredStyle: .alert), animated: false)
        case .authorizedAlways, .authorizedWhenInUse:
            break
        default:
            return
        }
    }
}

// MARK: - MKMapViewDelegate
extension MainViewController: MKMapViewDelegate {
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let bubble: Bubble = BubbleManager.sharedInstance.getCurrentBubbles()[indexPath]
        cell.textLabel?.text = "hello"
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BubbleManager.sharedInstance.getCurrentBubbles().count
    }
}
