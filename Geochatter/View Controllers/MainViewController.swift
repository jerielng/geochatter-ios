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
    @IBOutlet var chatCollectionView: UICollectionView!
    @IBOutlet var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = GlobalColors.appBackgroundColor
        mapView.showsUserLocation = true
        chatCollectionView.backgroundColor = GlobalColors.tableViewCellColor
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

// MARK: - MKMapViewDelegate
extension MainViewController: MKMapViewDelegate {
    func pinCurrentLocation() {
//        let currentLocationPin = MKMapItem.forCurrentLocation()
//        self.mapView.
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    
}
