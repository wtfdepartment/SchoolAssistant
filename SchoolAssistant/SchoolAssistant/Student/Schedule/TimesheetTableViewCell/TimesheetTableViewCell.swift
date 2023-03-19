//
//  TimesheetTableViewCell.swift
//  SchoolAssistant
//
//  Created by Александра on 12.03.23.
//

import UIKit
import SnapKit

class TimesheetTableViewCell: UITableViewCell {

    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var subStackView: UIStackView!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var roomLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    func setUpUI() {
        timeLabel.text = "8.00 -\n8.45"
        timeLabel.numberOfLines = 2
        subjectLabel.text = "Математика"
        taskLabel.text = "упр 100, стр 38"
        roomLabel.text = "101"
        
    }
    
//    func set(data: ){
//
//    }


  
    
}
