//
//  GlobalTheme.swift
//  Geochatter
//
//  Created by Jeriel Ng on 11/7/20.
//  Copyright © 2020 Jeriel Ng. All rights reserved.
//

import UIKit

class GlobalTheme {
    static func setDefaultTheme() {
        setNavBarDefaults()
        setTabBarDefaults()
        setTableViewDefaults()
        setTableViewCellDefaults()
    }

    private static func setNavBarDefaults() {
        UINavigationBar.appearance().titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: GlobalColor.textTint]
        UINavigationBar.appearance().barTintColor = GlobalColor.navBarBackground
    }

    private static func setTabBarDefaults() {
        UITabBar.appearance().barTintColor = GlobalColor.tabBarBackground
        UIBarButtonItem.appearance().tintColor = GlobalColor.textTint
    }

    private static func setViewControllerDefaults() {
        UIView.appearance().backgroundColor = GlobalColor.appBackground
    }

    private static func setTableViewDefaults() {
        UITableView.appearance().separatorColor = GlobalColor.appSeparator
    }

    private static func setTableViewCellDefaults() {
    }
}
