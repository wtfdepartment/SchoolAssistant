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
    var scheduleTeacher = [ClassType]()
    var scheduleStudent = [StudentSubjectType]()
    var role: UserRole = .teacher
    var showingDay = 0
    var showingMonth = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        colors = DaysOfWeek.allCases
        timesheetTableView.dataSource = self
        timesheetTableView.delegate = self
    }

    func set(_ day: DaysOfWeek, showingDay: Int, showingMonth: Int) {
        self.day = day
        guard let role = UserRole(rawValue: SaveManager.role) else { return }
        
        self.role = role
        if role == .teacher {
            scheduleTeacher = ScheduleEnum.teacher.getTeacherSchedule(day)
        } else if role == .student {
            scheduleStudent = ScheduleEnum.student.getStudentSchedule(day)
        }
        
        self.showingDay = showingDay
        self.showingMonth = showingMonth
    }

    func registerCell() {
        let nib = UINib(nibName: String(describing: TimesheetTableViewCell.self), bundle: nil)
        timesheetTableView.register(nib, forCellReuseIdentifier: String(describing: TimesheetTableViewCell.self))
        let colorNib = UINib(nibName: String(describing: ColorTableViewCell.self), bundle: nil)
        timesheetTableView.register(colorNib, forCellReuseIdentifier: String(describing: ColorTableViewCell.self))
        let textNib = UINib(nibName: String(describing: HeadTextTableViewCell.self), bundle: nil)
        timesheetTableView.register(textNib, forCellReuseIdentifier: String(describing: HeadTextTableViewCell.self))
    }

}

extension TimesheetViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 + scheduleStudent.count + scheduleTeacher.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id: String = {
            switch indexPath.row {
                case 0:
                    return String(describing: ColorTableViewCell.self)
                case 1:
                    return String(describing: HeadTextTableViewCell.self)
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
                guard let secondCell = cell as? HeadTextTableViewCell else { return cell }
                return secondCell
            default:
                guard let thirdCell = cell as? TimesheetTableViewCell else { return cell }
                
                if role == .teacher {
                    thirdCell.set(time: TimeType.allCases[indexPath.row - 2], data: scheduleTeacher[indexPath.row - 2])
                } else if role == .student {
                    thirdCell.set(time: TimeType.allCases[indexPath.row - 2], data: scheduleStudent[indexPath.row - 2], day: showingDay, month: showingMonth)
                }
                
                
                return thirdCell
        }
    }
}

extension TimesheetViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row > 1,
           let role = UserRole(rawValue: SaveManager.role){
            if role == .teacher {
                guard let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: HomeTaskViewController.self)) as? HomeTaskViewController else { return }
                
                vc.set(scheduleTeacher[indexPath.row - 2].lesson)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

