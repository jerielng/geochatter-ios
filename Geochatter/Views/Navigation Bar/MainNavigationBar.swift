//
//  MainNavigationBar.swift
//  Geochatter
//
//  Created by Jeriel Ng on 12/28/19.
//  Copyright © 2019 Jeriel Ng. All rights reserved.
//

import UIKit

class MainNavigationBar: UINavigationBar {
    @IBOutlet weak var addBubbleButton: UIBarButtonItem!
//    weak override var delegate: MainNavigationBarDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
