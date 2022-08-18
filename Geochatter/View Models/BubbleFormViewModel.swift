//
//  BubbleFormViewModel.swift
//  Geochatter
//
//  Created by Jeriel Ng on 12/8/20.
//  Copyright © 2020 Jeriel Ng. All rights reserved.
//

class BubbleFormViewModel {
    func createNewBubble(from bubbleText: String) {
        BubbleManager.sharedInstance.createNewBubble(with: bubbleText)
    }
}
