//
//  HomeTaskViewController.swift
//  SchoolAssistant
//
//  Created by Александра on 19.03.23.
//

import UIKit

class HomeTaskViewController: UIViewController {
    
    static let id = String(describing: HomeTaskViewController.self)
    
    
    @IBOutlet weak var themeContainerView: UIView!
    @IBOutlet weak var dateContainerView: UIView!
    @IBOutlet weak var homeTaskTableView: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    private var classCode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTaskTableView.dataSource = self
        homeTaskTableView.delegate = self
        let homeTask = UINib(nibName: String(describing: HomeTaskTableViewCell.self), bundle: nil)
        homeTaskTableView.register(homeTask, forCellReuseIdentifier: String(describing: HomeTaskTableViewCell.self))
        setUpContainerUI()
    }
    
    func setUpContainerUI() {
        themeContainerView.layer.cornerRadius = 12
        dateContainerView.layer.cornerRadius = 12
    }
    
    func set(_ classCode: String) {
        self.classCode = classCode
    }

}

extension HomeTaskViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension HomeTaskViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTaskTableViewCell.self), for: indexPath)
        guard let taskCell = cell as? HomeTaskTableViewCell else { return cell }
        
        taskCell.delegate = self
        taskCell.set(classCode)
        return taskCell
    }
}

extension HomeTaskViewController: HomeTaskDelegate {
    func getDate() -> String {
        let date = datePicker.date
        let newFormatter = ISO8601DateFormatter()
        return newFormatter.string(from: date)
    }
    
    func popVC(animated: Bool = true) {
        self.navigationController?.popViewController(animated: animated)
    }
}
