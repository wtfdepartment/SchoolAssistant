//
//  StudentsHomeWorkViewController.swift
//  SchoolAssistant
//
//  Created by Александра on 23.03.23.
//

import UIKit

class StudentsHomeWorkViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var homeworks = [HomeworkModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        registerCell()
        
        Provider.getHomework { response in
            var homework = response.homework
            for i in 0..<homework.count - 1 {
                guard let firstDay = homework[i].assignment.first?.date.day,
                      let firstMonth = homework[i].assignment.first?.date.month
                else { return }
                
                for j in i + 1..<homework.count {
                    guard let secondDay = homework[j].assignment.first?.date.day,
                          let secondMonth = homework[j].assignment.first?.date.month
                    else { return }
                    
                    if (firstMonth == secondMonth && firstDay > secondDay) || firstMonth > secondMonth {
                        homework.swapAt(i, j)
                    }
                }
                
                self.homeworks = homework.reversed()
            }
            self.tableView.reloadData()
        } failure: { error in
            print(error)
        }

    }

    private func registerCell() {
        let nib = UINib(nibName: StudentsHomeTaskTableViewCell.id, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: StudentsHomeTaskTableViewCell.id)
    }
}

extension StudentsHomeWorkViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeworks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StudentsHomeTaskTableViewCell.id, for: indexPath)
        guard let homeworkCell = cell as? StudentsHomeTaskTableViewCell else { return cell }
        
        homeworkCell.set(homework: homeworks[indexPath.row])
        return homeworkCell
    }
}
