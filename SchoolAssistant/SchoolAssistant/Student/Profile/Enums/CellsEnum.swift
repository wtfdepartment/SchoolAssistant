//
//  CellsEnum.swift
//  SchoolAssistant
//
//  Created by Александра on 12.03.23.
//

import UIKit

enum CellType {
    case infoView
    case qrCode
}

enum PersonType: CaseIterable {
    case student
    case qrCode
    case teacher
    
    
    var image: UIImageView {
        switch self {
            case .student:
                return UIImageView(image: UIImage(named: "Avatar"))
            case .teacher:
                return UIImageView(image: UIImage(named: "anotherAvatar"))
            case .qrCode:
                return UIImageView()
        }
    }
    
    var nameLabel: String {
        switch self {
            case .student:
                return "Student name"
            case .teacher:
                return "Teacher name"
            case .qrCode:
                return ""
        }
    }
    
    var infoLabel: String {
        switch self {
            case .student:
                return "Student info"
            case .teacher:
                return "Teacher info"
            case .qrCode:
                return ""
        }
    }
    
    var type: CellType {
        switch self {
            case .student, .teacher:
                return CellType.infoView
            case .qrCode:
                return CellType.qrCode
        }
    }
}
