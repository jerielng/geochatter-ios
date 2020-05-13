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

    private let bubbleManager = BubbleManager.sharedInstance
    private let userManager = UserManager.sharedInstance
    private let locationService = LocationService.sharedInstance
    private let firebaseService = FirebaseService.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = GlobalColors.appBackgroundColor

        firebaseService.delegate = self
        bubbleManager.delegate = self

        setUpLocationService()
        setUpMapView()
        setUpTableView()
        setUpNavBar()
    }

    private func setUpLocationService() {
        if CLLocationManager.locationServicesEnabled() {
            self.requestLocationPermissions()
        }
        locationService.setLocationDelegate(delegate: self)
    }

    private func setUpNavBar() {
        guard let navBarItem = navBar.topItem else { return }
        navBar.backgroundColor = GlobalColors.navBarColor
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
            locationService.isLocationDifferent(newLocation: location) else { return }
        locationService.updateCurrentLocation(location: location)
        self.updateViewRange(animated: true)
        FirebaseService.sharedInstance.downloadBubbles()
    }

    private func requestLocationPermissions() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationService.requestPermissions()
        case .denied, .restricted:
            present(UIAlertController(title: GlobalStrings.locationNotEnabledTitle,
                                      message: GlobalStrings.locationNotEnabledMessage,
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
    private func setUpMapView() {
        mapView.showsUserLocation = true
        self.updateViewRange(animated: false)
    }

    private func updateViewRange(animated: Bool) {
        guard let currentLocation = locationService.getCurrentLocation(),
            let locationDistance = CLLocationDistance(exactly: 3000) else { return }
        let currentRegion = MKCoordinateRegion(center: currentLocation.coordinate,
                                               latitudinalMeters: locationDistance,
                                               longitudinalMeters: locationDistance)
        mapView.setRegion(mapView.regionThatFits(currentRegion), animated: animated)
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    private func setUpTableView() {
        chatTableView.backgroundColor = GlobalColors.tableViewCellColor
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.register(UINib(nibName: BubbleCell.nibName, bundle: nil),
                               forCellReuseIdentifier: BubbleCell.reuseIdentifier)
        chatTableView.insetsContentViewsToSafeArea = true
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bubbleManager.getCurrentBubbles().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BubbleCell.reuseIdentifier) as! BubbleCell
        cell.authorLabel.text = bubbleManager.getCurrentBubbles()[indexPath.row].authorId
        cell.chatterLabel.text = bubbleManager.getCurrentBubbles()[indexPath.row].chatterText
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bubble = bubbleManager.getCurrentBubbles()[indexPath.row]
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return bubbleManager.getCurrentBubbles()[indexPath.row].authorId == userManager.getCurrentUser().getId()
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        }
    }
}

extension MainViewController: UpdateDelegate {
    func didUpdateData() {
        chatTableView.reloadData()
    }
}
