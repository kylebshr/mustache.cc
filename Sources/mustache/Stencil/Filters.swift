//
//  Filters.swift
//  CHTTPParser
//
//  Created by Kyle Bashour on 10/25/19.
//

import Foundation

private let titleFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMM. d"
    return formatter
}()

private let meetupFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "h:mma"
    return formatter
}()

enum Filter {
    static func titleDateFormatter(value: Any?) -> Any? {
        guard let date = value as? Date else {
            return value
        }

        return titleFormatter.string(from: date)
    }

    static func meetupTimeFormatter(value: Any?) -> Any? {
        guard let date = value as? Date else {
            return value
        }

        return meetupFormatter.string(from: date).lowercased()
    }
}
