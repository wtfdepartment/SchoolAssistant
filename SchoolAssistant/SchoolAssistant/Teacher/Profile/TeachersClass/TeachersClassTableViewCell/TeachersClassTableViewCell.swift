//
//  TeachersClassTableViewCell.swift
//  SchoolAssistant
//
//  Created by Александра on 20.03.23.
//

import UIKit

class TeachersClassTableViewCell: UITableViewCell {
    
    static let id = String(describing: TeachersClassTableViewCell.self)
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var studentsNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

   
    
}

