//
//  Bubble.swift
//  Geochatter
//
//  Created by Jeriel Ng on 12/28/19.
//  Copyright © 2019 Jeriel Ng. All rights reserved.
//

import Foundation

class Bubble: NSObject {
    var authorId: String
    var chatterText: String
    var dateTime: Date
    var coordinateLat: Double
    var coordinateLng: Double

    init(authorId: String, chatterText: String, dateTime: Date, coordinateLat: Double, coordinateLng: Double) {
        self.authorId = authorId
        self.chatterText = chatterText
        self.dateTime = dateTime
        self.coordinateLat = coordinateLat
        self.coordinateLng = coordinateLng
        super.init()
    }
}
