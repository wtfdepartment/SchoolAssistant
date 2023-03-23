//
//  SettingsTableViewCell.swift
//  SchoolAssistant
//
//  Created by Александра on 22.02.23.
//

import UIKit
import SnapKit

class SettingsTableViewCell: UITableViewCell {
    
   static let id = String(describing: SettingsTableViewCell.self)
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var settingView: UIView!
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var settingSwitch: UISwitch!
    
    private var type: SettingsType = .notification
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    func setUpUI() {
        self.selectionStyle = .none
        containerView.snp.makeConstraints { make in
            make.height.equalTo(68)
        }
        settingView.contentMode = .scaleAspectFill
        settingView.clipsToBounds = false
        settingView.layer.cornerRadius = 20
        settingView.backgroundColor = .white
        settingView.layer.shadowColor = UIColor(red: 0.675, green: 0.675, blue: 0.675, alpha: 0.25).cgColor
        settingView.layer.shadowOpacity = 1
        settingView.layer.shadowOffset = .zero
        settingView.layer.shadowRadius = 15
    }
    
    func set(_ type: SettingsType) {
        settingLabel.text = type.title
        settingSwitch.isHidden = type.element == .button
        settingButton.isHidden = type.element == .switcher
        settingButton.tintColor = UIColor.black
        settingButton.semanticContentAttribute = .forceRightToLeft

        var configuration = UIButton.Configuration.plain()
        configuration.imagePadding = 10
        settingButton.configuration = configuration

        switch type.element {
            case .switcher:
                switch type {
                    case .notification:
                        settingSwitch.isOn = SaveManager.notificationStatus
                    default:
                        settingSwitch.isOn = SaveManager.darkModeStatus
                }

            case .button:
                settingButton.setImage(type.image, for: .normal)
                if type == .language {
                    settingButton.setTitle(Locale.languageCode.uppercased(), for: .normal)
                } else {
                    settingButton.setTitle("", for: .normal)
                }
        }
    }

}
