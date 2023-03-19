//
//  SignInViewController.swift
//  SchoolAssistant
//
//  Created by Александра on 20.02.23.
//

//import UIKit
//
//protocol SignInViewControllerDelegate: AnyObject {
//    func userWasAuth(userRole: UserRole)
//}
//
//class SignInViewController: UIViewController {
//    
//    weak var delegate: SignInViewControllerDelegate?
//    
//    @IBOutlet weak var signInButton: UIButton!
//    @IBOutlet weak var schoolAssistImage: UIImageView!
//    @IBOutlet weak var schoolAssistLabel: UILabel!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        sleep(2)
//        delegate?.userWasAuth(userRole: .student)
//        setUpTextStyle()
//  
//    }
//    
//    func setUpTextStyle() {
//        schoolAssistLabel.font = UIFont(name: "LuckiestGuy-Regular", size: 32)
//        schoolAssistLabel.numberOfLines = 2
//        schoolAssistLabel.text = "School \nAssistant"
//    }
//    
//    @IBAction func signInDidTap(_ sender: Any) {
//        guard let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: RegistrationViewController.self)) else { return }
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: false, completion: nil)
//    }
//    
//}
