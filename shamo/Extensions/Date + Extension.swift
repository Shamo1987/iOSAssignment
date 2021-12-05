//
//  Date + Extension.swift
//  shamo
//
//  Created by Shamo Zahidov on 05/12/2021.
//

import Foundation
import UIKit

extension Date {
    func getElapsedInterval() -> String {

        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .hour, .day, .month, .year]
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .dropAll
        formatter.maximumUnitCount = 1

        var dateString: String?

        if self.timeIntervalSince(Date()) > -60*5 {
            dateString = NSLocalizedString("now", comment: "")
        } else {
            dateString = String.init(format: NSLocalizedString("%@ ago", comment: ""), locale: .current, formatter.string(from: self, to: Date())!)
        }

        return dateString ?? ""
    }
}
