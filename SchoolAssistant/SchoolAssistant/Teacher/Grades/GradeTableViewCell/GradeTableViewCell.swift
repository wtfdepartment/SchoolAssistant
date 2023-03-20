//
//  GradeTableViewCell.swift
//  SchoolAssistant
//
//  Created by Александра on 20.03.23.
//

import UIKit

class GradeTableViewCell: UITableViewCell {
    
    static let id = String(describing: GradeTableViewCell.self)

    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var gradeButton: UIButton!
    @IBOutlet weak var gradeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    @IBAction func gradeDidSet(_ sender: Any) {
        
    }
    
}
