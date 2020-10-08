//
//  FormatterUtils.swift
//  Geochatter
//
//  Created by Jeriel Ng on 5/7/20.
//  Copyright © 2020 Jeriel Ng. All rights reserved.
//

import Foundation

// MARK: - Date Formatting
class FormatterUtils {
    lazy var dateFormatter = DateFormatter()

    static func getCurrentDate() -> Date {
        return Date()
    }
}

// MARK: - Number Formatting
extension FormatterUtils {
    static func roundLocationValue(value: Double) -> Double {
        return Double(round(1000 * value) / 1000)
    }
}
