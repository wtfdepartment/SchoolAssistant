//
//  TeacherScheduleCollectionViewCell.swift
//  SchoolAssistant
//
//  Created by Александра on 19.03.23.
//

import UIKit

class TeacherScheduleCollectionViewCell: UICollectionViewCell {
    
    static let id = String(describing: TeacherScheduleCollectionViewCell.self)

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainLabel: UILabel!
    
    private var day: DaysOfWeek?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(day: DaysOfWeek) {
        self.day = day
        mainView.backgroundColor = day.color
        mainView.layer.cornerRadius = 20
        mainLabel.backgroundColor = .clear
        mainLabel.text = day.day
        mainLabel.textAlignment = .center
        mainLabel.textColor = .white
    }

}
