//
//  HomeTaskTableViewCell.swift
//  SchoolAssistant
//
//  Created by Александра on 19.03.23.
//

import UIKit

class HomeTaskTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var paragraphLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    
    @IBOutlet weak var paragraphTextField: UITextField!
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

 
    
}
