//
//  RegistrationViewController.swift
//  SchoolAssistant
//
//  Created by Александра on 21.02.23.
//

import UIKit
import SPAlert

protocol RegistrationViewControllerDelegate: AnyObject {
    func userWasAuth(userRole: UserRole)
}

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var schoolAssistImage: UIImageView!
    @IBOutlet weak var schoolAssistLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var loadingView: UIView!
    
    weak var delegate: RegistrationViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sleep(2)
        emailTextField.delegate = self
        passwordTextField.delegate = self
        setUpTextFieldStyle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if SaveManager.isLogin {
            guard let role = UserRole(rawValue: SaveManager.role) else {
                loadingView.isHidden = true
                return
            }
            
            var id = ""
            if role == .teacher {
                id = String(describing: TeacherTabBarController.self)
            } else if role == .student {
                id = String(describing: StudentTabBarController.self)
            }
            
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: id) else { return }
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false, completion: nil)
        } else {
            loadingView.isHidden = true
        }
    }
    
    func setUpTextFieldStyle() {
        schoolAssistLabel.numberOfLines = 2
        schoolAssistLabel.text = "School \nAssistant"
    }
    
    func saveData() {
        
    }
    
    @IBAction func signInDidTap(_ sender: Any) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text
        else { return }
        
        if email.isEmpty {
            let alert = SPAlertView(title: "Email is empty", preset: .error)
            alert.present(haptic: .error)
            return
        }
        
        if password.isEmpty {
            let alert = SPAlertView(title: "Password is empty", preset: .error)
            alert.present(haptic: .error)
            return
        }
        
        Provider.getUserInfo(email: email, password: password) { infoModel in
            guard let userInfo = infoModel.user,
                  let accessToken = infoModel.accessToken
            else { return }
            
            SaveManager.email = userInfo.email
            SaveManager.password = userInfo.password
            SaveManager.accessToken = accessToken
            SaveManager.user = userInfo
            SaveManager.role = userInfo.role
            SaveManager.isLogin = true
            
            if userInfo.role == "teacher" {
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: TeacherTabBarController.self)) else { return }
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false, completion: nil)
            } else if userInfo.role == "student" {
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: StudentTabBarController.self)) else { return }
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false, completion: nil)
            }
        } failure: { error in
            let alert = SPAlertView(title: error, preset: .error)
            alert.present(haptic: .error)
        }
    }
    
}

extension RegistrationViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
