//
//  BubbleCell.swift
//  Geochatter
//
//  Created by Jeriel Ng on 2/28/20.
//  Copyright © 2020 Jeriel Ng. All rights reserved.
//

import UIKit

class BubbleCell: UITableViewCell {
    static let reuseIdentifier = "BubbleCell"
    
    var userImage: UIImageView!
    var userNameText: UITextView!
    var userContentText: UITextView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    init(userId: String?, userPostId: String?) {
        if let userId = userId {
            userNameText.text = userId
        }

        if let userPostId = userPostId {
        }

        super.init(style: .default, reuseIdentifier: nil)
    }
}
