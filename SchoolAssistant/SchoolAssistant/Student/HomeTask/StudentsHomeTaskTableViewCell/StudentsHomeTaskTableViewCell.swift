//
//  StudentsHomeTaskTableViewCell.swift
//  SchoolAssistant
//
//  Created by Александра on 23.03.23.
//

import UIKit

class StudentsHomeTaskTableViewCell: UITableViewCell {

    @IBOutlet weak var timeForHomeTask: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var homeTaskLabel: UILabel!
    
    static let id = String(describing: StudentsHomeTaskTableViewCell.self)
    
    private var homework: HomeworkModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func set(homework: HomeworkModel) {
        guard let assignment = homework.assignment.first else { return }
        
        if let day = assignment.date.day,
           let month = assignment.date.month {
            timeForHomeTask.text = "\(String(format: "%02d", day)).\(String(format: "%02d", month))"
        }
        
        subjectLabel.text = homework.subject
        homeTaskLabel.text = "§\(assignment.paragraph), #\(assignment.exercise)"
    }
    
}
