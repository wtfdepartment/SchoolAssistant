//
//  HomeTaskTableViewCell.swift
//  SchoolAssistant
//
//  Created by Александра on 19.03.23.
//

import UIKit
import SPAlert

protocol HomeTaskDelegate: AnyObject {
    func getDate() -> String
    func popVC(animated: Bool)
}

class HomeTaskTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var paragraphLabel: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    
    @IBOutlet weak var paragraphTextField: UITextField!
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    
    @IBOutlet weak var sentButton: UIButton!
    
    weak var delegate: HomeTaskDelegate?
    
    private var classCode = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        containerView.layer.cornerRadius = 12
    }
    
    func set(_ classCode: String) {
        self.classCode = classCode
    }

 
    @IBAction func sentAction(_ sender: Any) {
        guard let delegate,
              let paragraphStr = paragraphTextField.text,
              let paragraph = Int(paragraphStr),
              let exerciseStr = taskTextField.text,
              let exercise = Int(exerciseStr)
        else { return }
        
        let date = delegate.getDate()
        Provider.addHomework(classCode: classCode, date: date, paragraph: paragraph, exercise: exercise) {
            let alert = SPAlertView(title: "Успешно", preset: .done)
            alert.present(haptic: .success)
            delegate.popVC(animated: true)
        } failure: {
            let alert = SPAlertView(title: "Ошибка", preset: .error)
            alert.present(haptic: .error)
        }

    }
    
}
