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
        guard let location = LocationService.sharedInstance.getCurrentLocation() else { return }
        let userId: String = UserManager.sharedInstance.getCurrentUser().authorId
        let bubble = Bubble(authorId: userId,
                            chatterText: text,
                            dateTime: DateManager.getCurrentDate(),
                            coordinateLat: location.coordinate.latitude,
                            coordinateLng: location.coordinate.longitude)
        FirebaseService.sharedInstance.uploadBubble(bubble)
    }
}
