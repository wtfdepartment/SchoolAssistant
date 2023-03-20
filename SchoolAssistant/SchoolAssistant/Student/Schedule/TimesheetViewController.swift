//
//  TimesheetViewController.swift
//  SchoolAssistant
//
//  Created by Александра on 4.03.23.
//

import UIKit
import SnapKit

class TimesheetViewController: UIViewController {

    @IBOutlet weak var timesheetTableView: UITableView!

    var colors = [DaysOfWeek]()
    var day: DaysOfWeek = .monday


    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        colors = DaysOfWeek.allCases
        timesheetTableView.dataSource = self
    }

    func set(_ day: DaysOfWeek) {
        self.day = day
    }

    func registerCell() {
        let nib = UINib(nibName: String(describing: TimesheetTableViewCell.self), bundle: nil)
        timesheetTableView.register(nib, forCellReuseIdentifier: String(describing: TimesheetTableViewCell.self))
        let colorNib = UINib(nibName: String(describing: ColorTableViewCell.self), bundle: nil)
        timesheetTableView.register(colorNib, forCellReuseIdentifier: String(describing: ColorTableViewCell.self))
    }

}

extension TimesheetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id: String = {
            switch indexPath.row {
                case 0:
                    return String(describing: ColorTableViewCell.self)
                case 1:
                    return String(describing: TimesheetTableViewCell.self)
                default:
                    return String(describing: TimesheetTableViewCell.self)
            }
        }()

        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        switch indexPath.row {
            case 0:
                guard let firstCell = cell as? ColorTableViewCell else { return cell }
                firstCell.backgroundColor = day.color
                return firstCell
            case 1:
                guard let secondCell = cell as? TimesheetTableViewCell else { return cell }
                return secondCell
            default:
                guard let thirdCell = cell as? TimesheetTableViewCell else { return cell }

                return thirdCell
        }
    }
}

