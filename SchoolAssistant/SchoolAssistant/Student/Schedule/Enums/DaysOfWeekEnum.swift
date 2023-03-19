//
//  DaysOfWeekEnum.swift
//  SchoolAssistant
//
//  Created by Александра on 4.03.23.
//

import UIKit

enum DaysOfWeek: Int, CaseIterable {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    
    var color: (UIColor) {
        switch self {
            case .monday:
                return (UIColor(red: 1, green: 0.412, blue: 0.408, alpha: 0.85))
            case .tuesday:
                return (UIColor(red: 0.478, green: 0.329, blue: 1, alpha: 0.85))
            case .wednesday:
                return (UIColor(red: 0.996, green: 0.561, blue: 0.38, alpha: 0.85))
            case .thursday:
                return (UIColor(red: 0.173, green: 0.761, blue: 1, alpha: 0.85))
            case .friday:
                return (UIColor(red: 0.353, green: 0.396, blue: 1, alpha: 0.85))
            case .saturday:
                return (UIColor(red: 0.588, green: 0.855, blue: 0.271, alpha: 0.85))
        }
    }
    var day: (String) {
        switch self {
            case .monday:
                return "пн"
            case .tuesday:
                return "вт"
            case .wednesday:
                return "ср"
            case .thursday:
                return "чт"
            case .friday:
                return "пт"
            case .saturday:
                return "сб"
        }
    }
}
