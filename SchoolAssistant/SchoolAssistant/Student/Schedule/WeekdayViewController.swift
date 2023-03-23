//
//  WeekdayViewController.swift
//  SchoolAssistant
//
//  Created by Александра on 4.03.23.
//

import UIKit
import SnapKit

protocol ViewControllerDelegate: AnyObject {
    func pushVC(_ vc: UIViewController)
}

class WeekdayViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var weekNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: WeekdayCollectionViewCell.id, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: WeekdayCollectionViewCell.id)
        collectionView.dataSource = self
        collectionView.delegate = self
        NumberOfWeek.allCases.forEach { numberOfWeek in
            setUpSegmentControlUI(numberOfWeek)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", image: UIImage(systemName: "gearshape"), target: self, action: #selector(homeTaskAction))
    }
    
    
    func set(_ weekNumber: Int) {
        self.weekNumber = weekNumber
    }
    
    func setUpUI() {
//        collectionView.snp.makeConstraints { make in
//            make.height.equalTo(550)
//        }
//        collectionView.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    func setUpSegmentControlUI(_ text: NumberOfWeek) {
        segmentControl.setTitle(text.num, forSegmentAt: text.rawValue)
    }
    
    @IBAction func selectedIndexDidChange(_ sender: Any) {
        collectionView.reloadData()
    }
    @IBAction func homeTaskAction(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: StudentsHomeWorkViewController.self)) else { return }
        self.navigationController?.pushViewController(vc, animated: true)
  
    }
    
}

extension WeekdayViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: WeekdayCollectionViewCell.self), for: indexPath)
        guard let weekCell = cell as? WeekdayCollectionViewCell,
              let day = DaysOfWeek(rawValue: indexPath.row)
        else { return cell}
        
        weekCell.set(day: day)
        return weekCell
    }
    
    
}

extension WeekdayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 20)
        }
    

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let collectionViewWidth = collectionView.bounds.width
            return CGSize(width: collectionViewWidth/2.5, height: collectionViewWidth/2.5)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }


}

extension WeekdayViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let day = DaysOfWeek(rawValue: indexPath.row) else { return }
        
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: TimesheetViewController.self)) as? TimesheetViewController else { return }
        
        var titleDay = Date.currentDay + 7 * segmentControl.selectedSegmentIndex
        var titleMonth = Date.currentMonth
        
        if indexPath.row + 1 < Date.currentDayOfWeek {
            titleDay -= Date.currentDayOfWeek - indexPath.row
            titleDay += 1
        } else if indexPath.row + 1 > Date.currentDayOfWeek {
            titleDay += indexPath.row + 1 - Date.currentDayOfWeek
        }
        
        if titleDay > Date.daysInMonth {
            titleDay -= Date.daysInMonth
            if titleMonth + 1 > 12 {
                titleMonth = 1
            } else {
                titleMonth += 1
            }
        }
        
        vc.set(day, showingDay: titleDay, showingMonth: titleMonth)
        
        vc.navigationItem.title = "\(day.day) \(titleDay)"
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension WeekdayViewController: ViewControllerDelegate {
    func pushVC(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension Date {
    static var day: Int {
        let calendar = Calendar.current
        return calendar.component(.day, from: Date())
    }
    
    static var month: Int {
        let calendar = Calendar.current
        return calendar.component(.month, from: Date())
    }
    
    static var dayOfWeek: Int {
        let calendar = Calendar.current
        return calendar.component(.weekday, from: Date())
    }
}

