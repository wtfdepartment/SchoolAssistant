//
//  SaveManager.swift
//  SchoolAssistant
//
//  Created by Александра on 17.03.23.
//

import Foundation

final class SaveManager {
    private static let manager = UserDefaults.standard
   
    static var notificationStatus: Bool {
        get {
            manager.value(forKey: #function) as? Bool ?? false
        }
        set {
            manager.set(newValue, forKey: #function)
        }
    }
    
    static var darkModeStatus: Bool {
        get {
            manager.value(forKey: #function) as? Bool ?? false
        }
        set {
            manager.set(newValue, forKey: #function)
        }
    }
    
    static var accessToken: String {
        get {
            manager.value(forKey: #function) as? String ?? ""
        }
        set {
            manager.set(newValue, forKey: #function)
        }
    }
    
    static var role: String {
        get {
            manager.value(forKey: #function) as? String ?? ""
        }
        set {
            manager.set(newValue, forKey: #function)
        }
    }
    
    static var email: String {
        get {
            manager.value(forKey: #function) as? String ?? ""
        }
        set {
            manager.set(newValue, forKey: #function)
        }
    }
    
    static var password: String {
        get {
            manager.value(forKey: #function) as? String ?? ""
        }
        set {
            manager.set(newValue, forKey: #function)
        }
    }
    
    static var isLogin: Bool {
        get {
            manager.value(forKey: #function) as? Bool ?? true
        }
        set {
            manager.set(newValue, forKey: #function)
        }
    }
    
    static var classCode: String {
        get {
            manager.value(forKey: #function) as? String ?? ""
        }
        set {
            manager.set(newValue, forKey: #function)
        }
    }
    
    static var firstName: String {
        get {
            manager.value(forKey: #function) as? String ?? ""
        }
        set {
            manager.set(newValue, forKey: #function)
        }
    }
    
    static var lastName: String {
        get {
            manager.value(forKey: #function) as? String ?? ""
        }
        set {
            manager.set(newValue, forKey: #function)
        }
    }
    
    static var assignedTeacher: String {
        get {
            manager.value(forKey: #function) as? String ?? ""
        }
        set {
            manager.set(newValue, forKey: #function)
        }
    }
}


