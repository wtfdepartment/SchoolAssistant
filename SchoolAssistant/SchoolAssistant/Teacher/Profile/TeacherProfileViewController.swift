//
//  TeacherProfileViewController.swift
//  SchoolAssistant
//
//  Created by Александра on 12.03.23.
//

import UIKit

class TeacherProfileViewController: UIViewController {

    @IBOutlet weak var profileTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", image: UIImage(systemName: "gearshape"), target: self, action: #selector(profileSettingsAction))
    }
    
    @IBAction func profileSettingsAction(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: SettingsViewController.self)) else { return }
        self.navigationController?.pushViewController(vc, animated: true)
  
    }


}
