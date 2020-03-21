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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = GlobalColors.appBackgroundColor
        setUpMapView()
        setUpTableView()
        setUpNavBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    private func setUpMapView() {
        mapView.showsUserLocation = true
    }

    private func setUpTableView() {
        chatTableView.backgroundColor = GlobalColors.tableViewCellColor
    }

    private func setUpNavBar() {
        guard let navBarItem = navBar.topItem else { return }
        navBar.backgroundColor = GlobalColors.tableViewCellColor
        navBarItem.title = GlobalStrings.mainVCTitle
        navBarItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonClicked))
    }

    @objc
    private func addButtonClicked() {
        let bubbleFormVC = BubbleFormViewController()
        self.present(bubbleFormVC, animated: true, completion: nil)
    }
}

// MARK: - MKMapViewDelegate
extension MainViewController: MKMapViewDelegate {
    func pinCurrentLocation() {
//        let currentLocationPin = MKMapItem.forCurrentLocation()
//        self.mapView.
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("")
    }
}
