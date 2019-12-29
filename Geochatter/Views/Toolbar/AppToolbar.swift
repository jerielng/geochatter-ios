//
//  AppToolbar.swift
//  Geochatter
//
//  Created by Jeriel Ng on 12/28/19.
//  Copyright © 2019 Jeriel Ng. All rights reserved.
//

import UIKit

class AppToolbar: UIToolbar {
    
    @IBOutlet weak var addBubbleButton: UIBarButtonItem!
//    weak override var delegate: AppToolbarDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
