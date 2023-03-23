//
//  SubjectEnum.swift
//  SchoolAssistant
//
//  Created by Александра on 21.03.23.
//

import Foundation

enum SubjectEnum: String {
    case maths = "Математика"
    
    var apiSubjectName: String {
        switch self {
            case .maths:
                return "maths"
        }
    }
}
