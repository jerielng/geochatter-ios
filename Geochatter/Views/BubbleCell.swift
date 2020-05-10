//
//  BubbleCell.swift
//  Geochatter
//
//  Created by Jeriel Ng on 2/28/20.
//  Copyright © 2020 Jeriel Ng. All rights reserved.
//

import UIKit

class BubbleCell: UITableViewCell {
    static let reuseIdentifier = "bubbleCell"

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var chatterLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
