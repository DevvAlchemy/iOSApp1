//
//  DateExtention.swift
//  iOSAPP
//
//  Created by Royal K on 2025-01-25.
//

import Foundation

extension Date {
    // Format a date using the specified format. this allows for the date to be passed smoothly in our preferred way
    func formatted(as format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

    var yearMonthDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy MM dd"
        return dateFormatter.string(from: self)
    }

    // Check another date is the same year, month and day.
    func isSameDay(as day: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(self, inSameDayAs: day)
    }

    var dayName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
