//
//  BubbleFormViewController.swift
//  Geochatter
//
//  Created by Jeriel Ng on 3/9/20.
//  Copyright © 2020 Jeriel Ng. All rights reserved.
//

import UIKit

class BubbleFormViewController: UIViewController {
    @IBOutlet weak var bubbleEntryTextView: UITextView!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var attachImageButton: UIButton!

    var imagePickerController: UIImagePickerController!

    private var hasTextViewBeenEdited: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextView()
        setUpAttachImageButton()
        setUpImagePickerController()
        setUpPostButton()
        setUpCancelButton()
    }

    private func setUpTextView() {
        bubbleEntryTextView.delegate = self
    }

    private func setUpAttachImageButton() {
        attachImageButton.addTarget(self, action: #selector(attachImageButtonClicked), for: .touchUpInside)
    }

    private func setUpImagePickerController() {
        imagePickerController = UIImagePickerController()
    }

    private func setUpPostButton() {
        postButton.addTarget(self, action: #selector(postButtonClicked), for: .touchUpInside)
    }

    private func setUpCancelButton() {
        cancelButton.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
    }

    @objc
    private func attachImageButtonClicked() {
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

    @objc
    private func postButtonClicked() {
        guard let bubbleText = bubbleEntryTextView.text else { return }
        BubbleManager.sharedInstance.createNewBubble(with: bubbleText)
        dismiss(animated: true, completion: nil)
    }

    @objc
    private func cancelButtonClicked() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension BubbleFormViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard !hasTextViewBeenEdited else { return }
        hasTextViewBeenEdited = true
        textView.text = ""
    }
}
