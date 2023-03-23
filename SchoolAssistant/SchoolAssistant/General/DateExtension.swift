//
//  DateExtension.swift
//  SchoolAssistant
//
//  Created by Александра on 22.03.23.
//

import Foundation

extension Date {
    private static var currentCalendar = Calendar.current
    private static var currentDate = Date()
    
    static var currentDay: Int {
        return currentCalendar.component(.day, from: currentDate)
    }
    
    static var currentMonth: Int {
        return currentCalendar.component(.month, from: currentDate)
    }

    static var currentYear: Int {
        return currentCalendar.component(.year, from: currentDate)
    }

    static var currentDayOfWeek: Int {
        let systemDayOfWeek = currentCalendar.component(.weekday, from: currentDate)
        if systemDayOfWeek > 1, systemDayOfWeek < 8 {
            return systemDayOfWeek - 1
        } else {
            return 7
        }
    }

    static var isLeapYear: Bool {
        if currentYear % 4 == 0 {
            if currentYear % 100 == 0 {
                return currentYear % 400 == 0
            }

            return true
        }

        return false
    }

    static var daysInMonth: Int {
        switch currentMonth {
            case 1, 3, 5, 7, 8, 10, 12:
                return 31
            case 2, 4, 6, 9, 11:
                return 30
            default:
                return isLeapYear ? 29 : 28
        }
    }

    static func daysInMonth(_ month: Int) -> Int {
        switch month {
        case 1, 3, 5, 7, 8, 10, 12:
            return 31
        case 2, 4, 6, 9, 11:
            return 30
        default:
            return isLeapYear ? 29 : 28
        }
    }
}

