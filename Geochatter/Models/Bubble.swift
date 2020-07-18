//
//  Bubble.swift
//  Geochatter
//
//  Created by Jeriel Ng on 12/28/19.
//  Copyright © 2019 Jeriel Ng. All rights reserved.
//

import Foundation

class Bubble: NSObject {
    var bubbleId: String?
    var authorId: String
    var chatterText: String
    var dateTime: Date
    var coordinateLat: Double
    var coordinateLng: Double

    init(bubbleId: String?, authorId: String, chatterText: String, dateTime: Date, coordinateLat: Double, coordinateLng: Double) {
        self.bubbleId = bubbleId
        self.authorId = authorId
        self.chatterText = chatterText
        self.dateTime = dateTime
        self.coordinateLat = coordinateLat
        self.coordinateLng = coordinateLng
        super.init()
    }
}
