//
//  SettingsCellsType.swift
//  SchoolAssistant
//
//  Created by Александра on 9.03.23.
//

import UIKit

enum ElementType {
    case switcher
    case button
}

enum SettingsType: Int, CaseIterable {
    case notification = 0
    case language
    case darkMode
    case help
    case logOut
    
    var title: String {
        switch self {
            case .notification:
                return "Notifications"
            case .language:
                return "Language"
            case .darkMode:
                return "Dark mode"
            case .help:
                return "Help"
            case .logOut:
                return "Log out"
        }
    }
    
    var element: ElementType {
        switch self {
            case .notification, .darkMode:
                return ElementType.switcher
            case .language, .help, .logOut:
                return ElementType.button
        }
    }
    
    var image: UIImage? {
        switch self {
            case .language, .help:
                return UIImage(systemName: "chevron.right")
            default:
                return UIImage(systemName: "rectangle.portrait.and.arrow.right")
        }
    }
}

extension Locale {
    static var languageCode: String {
        Locale.current.language.languageCode?.identifier ?? ""
    }
}
