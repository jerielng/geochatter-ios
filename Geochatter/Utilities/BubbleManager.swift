//
//  BubbleManager.swift
//  Geochatter
//
//  Created by Jeriel Ng on 3/9/20.
//  Copyright © 2020 Jeriel Ng. All rights reserved.
//

import Foundation

class BubbleManager {
    static let sharedInstance = BubbleManager()

    func createNewBubble(with text: String) {
        let bubble = Bubble(authorId: "",
                            chatterText: text,
                            dateTime: DateManager.getCurrentDate(),
                            coordinateLat: 0,
                            coordinateLng: 0)
    }
}
