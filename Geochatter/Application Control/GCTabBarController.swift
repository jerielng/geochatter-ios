//
//  GCTabBarController.swift
//  Geochatter
//
//  Created by Jeriel Ng on 6/30/20.
//  Copyright © 2020 Jeriel Ng. All rights reserved.
//

import UIKit

class GCTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.barTintColor = GlobalColors.tabBarColor
nController(rootViewController: MainViewController())
        nearbyController.tabBarItem = UITabBarItem(title: "Nearby", image: nil, selectedImage: nil)
        return nearbyController
    }

    private func createMyPostsController() -> UIViewController {
        let loginController = BubbleFormViewController()
        loginController.tabBarItem = UITabBarItem(title: "My Posts", image: nil, selectedImage: nil)
        return loginController
    }
}
