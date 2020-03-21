//
//  BubbleFormViewController.swift
//  Geochatter
//
//  Created by Jeriel Ng on 3/9/20.
//  Copyright © 2020 Jeriel Ng. All rights reserved.
//

import UIKit

class BubbleFormViewController: UIViewController {
    @IBOutlet weak var headerText: UITextView!
    @IBOutlet weak var bubbleEntryTextField: UITextField!
    @IBOutlet weak var postButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHeaderText()
        setUpPostButton()
    }

    func setUpHeaderText() {
        headerText.text = GlobalStrings.bubbleInputPrompt
    }

    func setUpPostButton() {
        postButton.addTarget(self, action: #selector(postButtonClicked(sender:)), for: UIControl.Event.touchUpInside)
    }

    @IBAction func postButtonClicked(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
