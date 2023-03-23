//
//  ScheduleEnum.swift
//  SchoolAssistant
//
//  Created by Александра on 22.03.23.
//

import Foundation

enum StudentSubjectType {
    
    case math
    case engLanguage
    case belLit
    case belLanguage
    case biology
    case geography
    case history
    case physics
    case sport
    case chemistry
    case programming
    
    var subject: String {
        switch self {
            case .math:         return "Математика"
            case .engLanguage:  return "Английский язык"
            case .belLit:       return "Беларуская литература"
            case .belLanguage:  return "Беларуский язык"
            case .biology:      return "Биология"
            case .geography:    return "География"
            case .history:      return "История"
            case .physics:      return "Физика"
            case .sport:        return "Физкультура"
            case .chemistry:    return "Химия"
            case .programming:  return "Информатика"
        }
    }
    
    var room: String {
        switch self {
            case .math:         return "101"
            case .engLanguage:  return "207"
            case .belLit:       return "317"
            case .belLanguage:  return "317"
            case .biology:      return "205"
            case .geography:    return "300"
            case .history:      return "112"
            case .physics:      return "223"
            case .sport:        return "0"
            case .chemistry:    return "125"
            case .programming:  return "203"
        }
    }
}

enum TimeType: Int, CaseIterable {
    case firstLesson
    case secondLesson
    case thirdLesson
    case fourthLesson
    case fifthLesson
    case sixthLesson
    
    var time: String{
        switch self {
            case .firstLesson:         return "8.00 -\n8.45"
            case .secondLesson:        return "9.00 -\n9.45"
            case .thirdLesson:         return "10.00 -\n10.45"
            case .fourthLesson:        return "11.00 -\n11.45"
            case .fifthLesson:         return "12.00 -\n12.45"
            case .sixthLesson:         return "13.00 -\n13.45"
        }
    }
}

enum ClassType {
    case elevenA
    case elevenB
    case sevenA
    case sevenB
    case eightA
    case `none`
    
    var lesson: String {
        switch self {
            case .elevenA:  return "11\"A\""
            case .elevenB:  return "11\"Б\""
            case .sevenA:   return "7\"A\""
            case .sevenB:   return "7\"Б\""
            case .eightA:   return "8\"A\""
            case .`none`:    return "-"
        }
    }
    
    var room: String {
        switch self {
            case .elevenA:  return "101"
            case .elevenB:  return "312"
            case .sevenA:   return "205"
            case .sevenB:   return "113"
            case .eightA:   return "215"
            case .`none`:    return "-"
        }
    }
}

enum ScheduleEnum {
    case teacher
    case student
    
    func getTeacherSchedule(_ day: DaysOfWeek) -> [ClassType] {
        if self == .student {
            return []
        }
        
        switch day {
            case .monday:
                return [.sevenA, .elevenA, .elevenB, .none, .elevenA]
            case .tuesday:
                return [.elevenA, .none, .elevenB, .sevenA]
            case .wednesday:
                return [.elevenB, .none, .none, .elevenA]
            case .thursday:
                return [.sevenB, .elevenA, .none, .eightA]
            case .friday:
                return [.elevenB, .eightA, .elevenA]
            case .saturday:
                return [.elevenA]
        }
    }
    
    func getStudentSchedule(_ day: DaysOfWeek) -> [StudentSubjectType] {
        if self == .teacher {
            return []
        }
        
        switch day {
            case .monday:
                return [.belLanguage, .belLit, .engLanguage, .sport, .math]
            case .tuesday:
                return [.math, .physics, .physics, .chemistry]
            case .wednesday:
                return [.physics, .biology, .engLanguage, .math, .biology]
            case .thursday:
                return [.biology, .math, .chemistry, .programming, .belLanguage, .belLit]
            case .friday:
                return [.physics, .biology, .math, .belLanguage, .belLit]
            case .saturday:
                return [.math]
        }
    }
}
