//
//  BubbleManager.swift
//  Geochatter
//
//  Created by Jeriel Ng on 3/9/20.
//  Copyright © 2020 Jeriel Ng. All rights reserved.
//

import Foundation

class BubbleManager: NSObject {
    static let sharedInstance = BubbleManager()

    func createNewBubble(with text: String) {
        let bubble = Bubble(authorId: "",
                            chatterText: text,
                            dateTime: Date(),
                            coordinateLat: 0,
                            coordinateLng: 0)
    }
}