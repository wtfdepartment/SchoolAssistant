//
//  ProfileViewController.swift
//  SchoolAssistant
//
//  Created by Александра on 21.02.23.
//

import UIKit
import SnapKit
import DeviceKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileInformationView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personScholLocationLabel: UILabel!
    
    @IBOutlet weak var qrContainerView: UIView!
    @IBOutlet weak var qrCodeImageView: UIImageView!
    
    @IBOutlet weak var teacherInformationView: UIView!
    @IBOutlet weak var teacherImageView: UIImageView!
    
    @IBOutlet weak var teacherSexLabel: UILabel!
    @IBOutlet weak var teacherNameLabel: UILabel!
    @IBOutlet weak var qrContainerTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUptitleLabelUI()
        addProfileViewUI(to: profileInformationView)
        addProfileViewUI(to: teacherInformationView)
        setUpQRCodeUI()
        setUpProfileImageViewUI(to: profileImageView)
        setUpProfileImageViewUI(to: teacherImageView)
    }
    
    private func setUptitleLabelUI() {
        let titleLabel = UILabel()
        titleLabel.text = "Аккаунт"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", image: UIImage(systemName: "gearshape"), target: self, action: #selector(profileSettingsAction))
        navigationItem.titleView = titleLabel
    }
    
    private func addProfileViewUI(to view: UIView) {
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = false
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor(red: 0.675, green: 0.675, blue: 0.675, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 15
    }
    
    private func setUpProfileImageViewUI(to view: UIView) {
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2
        profileImageView.backgroundColor = .white
    }
    
    private func setUpQRCodeUI() {
        qrContainerView.layer.cornerRadius = 16
        let personName = personNameLabel.text
        if let name = personName {
            let combineString = "\(name)"
            qrCodeImageView.image = generateQRCode(Name: combineString)
        }
        
        if Device.current == .simulator(.iPhone8) {
            return
        }
        
        if Device.current != .iPhone8 {
            qrContainerTopConstraint.constant = 50
            view.layoutIfNeeded()
        }
    }
    
    func generateQRCode(Name: String) -> UIImage? {
        let data = Name.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        return nil
    }
    
    private func setUpAnotherProfileImageViewUI() {
        
    }
    
    @IBAction func profileSettingsAction(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: SettingsViewController.self)) else { return }
        self.navigationController?.pushViewController(vc, animated: true)
  
    }
}


