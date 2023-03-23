//
//  NumberOfWeek.swift
//  SchoolAssistant
//
//  Created by Александра on 21.03.23.
//

import Foundation

enum NumberOfWeek: Int, CaseIterable {
    case  firstWeek
    case  secondWeek
    case  thirdWeek
    
    var num: String {
        switch self {
            case .firstWeek:
                return "20.03 - 26.03"
            case .secondWeek:
                return "27.03 - 02.04"
            case .thirdWeek:
                return "03.04 - 09.04"
        }
    }
}
