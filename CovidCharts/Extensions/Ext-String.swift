//
//  Ext-String.swift
//  CovidCharts
//
//  Created by Timothy Stokarski on 13/04/2020.
//  Copyright © 2020 Timothy Stokarski. All rights reserved.
//

import UIKit

enum DateStyle {
    case short
    case medium
    case long
    case superlong
    case month
    case year
    case day
}

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension String {
    
    func formattedDate(_ style: DateStyle) -> String {
        var dateToFormat = self
        dateToFormat = dateToFormat.replacingOccurrences(of: ".000", with: "")
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        var date = formatter.date(from: dateToFormat)
        let secondFormatter = DateFormatter()
        secondFormatter.locale = Locale(identifier: "pl_PL")
        secondFormatter.timeZone = .current
        switch style {
        case .short: secondFormatter.dateFormat = "dd.MM"
        case .long: secondFormatter.dateFormat = "dd MMMM YYYY"
        case .medium: secondFormatter.dateFormat = "dd MMMM"
        case .month: secondFormatter.dateFormat = "MMM"
        case .year: secondFormatter.dateFormat = "YY"
        case .day: secondFormatter.dateFormat = "dd"
        case .superlong:
            date?.addTimeInterval(7200)
            secondFormatter.dateFormat = "HH:mm, dd MMMM YYYY"
        }
        return secondFormatter.string(from: date ?? Date())
    }
    
}

extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}
