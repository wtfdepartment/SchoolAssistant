//
//  SettingsViewController.swift
//  SchoolAssistant
//
//  Created by Александра on 22.02.23.
//

import UIKit

enum personType {
    case teacher
    case student
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personEmailLabel: UILabel!
    @IBOutlet weak var settingsTableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpProfileUI()
        let nib = UINib(nibName: SettingsTableViewCell.id, bundle: nil)
        settingsTableView.register(nib, forCellReuseIdentifier: SettingsTableViewCell.id)
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        
        personNameLabel.text = "\(SaveManager.firstName) \(SaveManager.lastName)"
        personEmailLabel.text = SaveManager.email
    }
    
    func setUpProfileUI() {
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2
        profileImageView.backgroundColor = .white
    }
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SettingsTableViewCell.self), for: indexPath) as? SettingsTableViewCell else { return UITableViewCell() }
        
        cell.set(SettingsType.allCases[indexPath.row])
//        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
        return cell
    }

}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == SettingsType.allCases.count - 1 {
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: RegistrationViewController.self)) as? RegistrationViewController else { return }
            SaveManager.isLogin = false
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false, completion: nil)
        }
    }
}
