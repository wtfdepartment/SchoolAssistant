//
//  TeacherScheduleViewController.swift
//  SchoolAssistant
//
//  Created by Александра on 19.03.23.
//

import UIKit

class TeacherScheduleViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    setUptitleLabelUI()

    }
    private func setUptitleLabelUI() {
        let titleLabel = UILabel()
        titleLabel.text = "Аккаунт"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", image: UIImage(systemName: "gearshape"), target: self, action: #selector(profileSettingsAction))
        navigationItem.titleView = titleLabel
    }
    
    @IBAction func profileSettingsAction(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: SettingsViewController.self)) else { return }
        self.navigationController?.pushViewController(vc, animated: true)
  
    }


}
