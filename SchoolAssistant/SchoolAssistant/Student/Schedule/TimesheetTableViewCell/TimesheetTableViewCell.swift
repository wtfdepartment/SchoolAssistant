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
    
    private var time: TimeType = .firstLesson
    private var dataTeacher: ClassType?
    private var dataStudent: StudentSubjectType?
    private var day = 0
    private var month = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    func set(time: TimeType, data: ClassType) {
        self.time = time
        self.dataTeacher = data
        setUpUI()
    }
    
    func set(time: TimeType, data: StudentSubjectType, day: Int, month: Int) {
        self.time = time
        self.dataStudent = data
        self.day = day
        self.month = month
        setUpUI()
    }
    
    func setUpUI() {
        self.selectionStyle = .none
        timeLabel.text = time.time
        timeLabel.numberOfLines = 2
        if let dataTeacher {
            subjectLabel.text = dataTeacher.lesson
            roomLabel.text = dataTeacher.room
            taskLabel.isHidden = true
        } else if let dataStudent {
            subjectLabel.text = dataStudent.subject
            roomLabel.text = dataStudent.room
        }
        
        
    }
    
//    func set(data: ){
//
//    }


  
    
}
