//
//  DateUtils.swift
//  Geochatter
//
//  Created by Jeriel Ng on 5/7/20.
//  Copyright © 2020 Jeriel Ng. All rights reserved.
//

import Foundation

class DateUtils {
    lazy var dateFormatter = DateFormatter()

    static func getCurrentDate() -> Date {
        return Date()
    }
}
