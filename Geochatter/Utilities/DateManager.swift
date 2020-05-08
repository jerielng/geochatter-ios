//
//  DateManager.swift
//  Geochatter
//
//  Created by Jeriel Ng on 5/7/20.
//  Copyright © 2020 Jeriel Ng. All rights reserved.
//

import Foundation

class DateManager {
    lazy var dateFormatter = DateFormatter()

    static func getCurrentDate() -> Date {
        Date()
    }
}
