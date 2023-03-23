//
//  HeadTextTableViewCell.swift
//  SchoolAssistant
//
//  Created by Александра on 21.03.23.
//

import UIKit

class HeadTextTableViewCell: UITableViewCell {
    
    static let id = String(describing: HeadTextTableViewCell.self)

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var subjectTaskLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    func setUpUI() {
        guard let role = UserRole(rawValue: SaveManager.role) else { return }
        
        self.selectionStyle = .none
        timeLabel.text = "Время"
        
        if role == .teacher {
            subjectTaskLabel.text = "Класс"
        } else {
            subjectTaskLabel.text = "Предмет/Задание"
        }
        
        classLabel.text = "Кабинет"
    }
    
}
