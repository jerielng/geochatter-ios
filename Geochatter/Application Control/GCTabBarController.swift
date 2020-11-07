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
        setUpViewControllers()
    }

    private func setUpViewControllers() {
        var viewControllers = [UIViewController]()
        viewControllers.append(createNearbyController())
        viewControllers.append(createMyPostsController())
        setViewControllers(viewControllers, animated: false)
    }

    private func createNearbyController() -> UIViewController {
        let nearbyController = GCNavigationController(rootViewController: MainViewController())
        nearbyController.tabBarItem = UITabBarItem(title: GlobalStrings.barItemNearby, image: nil, selectedImage: nil)
        return nearbyController
    }

    private func createMyPostsController() -> UIViewController {
        let myPostsController = GCNavigationController(rootViewController: MyPostsViewController())
        myPostsController.tabBarItem = UITabBarItem(title: GlobalStrings.barItemMyPosts, image: nil, selectedImage: nil)
        return myPostsController
    }
}
