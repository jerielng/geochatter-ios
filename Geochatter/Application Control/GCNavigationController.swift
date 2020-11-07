//
//  GCNavigationController.swift
//  Geochatter
//
//  Created by Jeriel Ng on 6/28/20.
//  Copyright © 2020 Jeriel Ng. All rights reserved.
//

import UIKit

class GCNavigationController: UINavigationController {
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        setupNavigationBar()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setupNavigationBar() {
        navigationBar.isTranslucent = false
    }
}
