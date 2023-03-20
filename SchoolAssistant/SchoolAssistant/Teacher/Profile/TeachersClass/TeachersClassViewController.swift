//
//  TeachersClassViewController.swift
//  SchoolAssistant
//
//  Created by Александра on 20.03.23.
//

import UIKit

class TeachersClassViewController: UIViewController {
    
    var names = ["Антонов Кирилл", "Басалай Евгений", "Гринчик Анна", "Жук Алексей", "Конь Александр", "Лизова Анастасия", "Мамкин Программист", "Юсупова Алина", "Шумовик Павел", "Янкович Дмитрий"]

    @IBOutlet weak var classTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classTableView.dataSource = self
        let nib = UINib(nibName: String(describing: TeachersClassTableViewCell.self), bundle: nil)
        classTableView.register(nib, forCellReuseIdentifier: String(describing: TeachersClassTableViewCell.self))
    }
 
}

extension TeachersClassViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TeachersClassTableViewCell.id, for: indexPath)
        guard let studentCell = cell as? TeachersClassTableViewCell else { return cell }
        studentCell.studentsNameLabel.text = names[indexPath.row]
        return studentCell
    }
    
    
}
