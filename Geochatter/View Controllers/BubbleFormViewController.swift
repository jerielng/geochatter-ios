//
//  BubbleFormViewController.swift
//  Geochatter
//
//  Created by Jeriel Ng on 3/9/20.
//  Copyright © 2020 Jeriel Ng. All rights reserved.
//

import UIKit

class BubbleFormViewController: UIViewController {
    @IBOutlet weak var bubbleEntryTextField: UITextField!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var attachImageButton: UIButton!

    var imagePickerController: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpImagePickerController()
        setUpAttachImageButton()
        setUpPostButton()
    }

    private func setUpAttachImageButton() {
        attachImageButton.addTarget(self, action: #selector(attachImageButtonClicked), for: UIControl.Event.touchUpInside)
    }

    private func setUpImagePickerController() {
        imagePickerController = UIImagePickerController()
    }

    private func setUpPostButton() {
        postButton.addTarget(self, action: #selector(postButtonClicked), for: UIControl.Event.touchUpInside)
    }

    @IBAction private func attachImageButtonClicked() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: GlobalStrings.takePhotoButton, style: .default) { [weak self] _ in
            guard let strongSelf = self,
                UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
            strongSelf.present(strongSelf.imagePickerController, animated: false, completion: nil)
        })

        alert.addAction(UIAlertAction(title: GlobalStrings.choosePhotoButton, style: .default) { [weak self] _ in
            guard let strongSelf = self,
                UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
            strongSelf.present(strongSelf.imagePickerController, animated: false, completion: nil)
        })

        alert.addAction(UIAlertAction(title: GlobalStrings.cancel, style: .cancel, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }

    @IBAction private func postButtonClicked() {
        guard let bubbleText = bubbleEntryTextField.text else { return }
        BubbleManager.sharedInstance.createNewBubble(with: bubbleText)
        dismiss(animated: true, completion: nil)
    }
}
