//
//  TeacherWeekdayViewController.swift
//  SchoolAssistant
//
//  Created by Александра on 19.03.23.
//

import UIKit

class TeacherWeekdayViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: TeacherScheduleCollectionViewCell.id, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: TeacherScheduleCollectionViewCell.id)
        collectionView.dataSource = self
        collectionView.delegate = self

     
    }
   

}

extension TeacherWeekdayViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TeacherScheduleCollectionViewCell.self), for: indexPath)
        guard let weekCell = cell as? TeacherScheduleCollectionViewCell,
              let day = DaysOfWeek(rawValue: indexPath.row)
        else { return cell}
        
        weekCell.set(day: day)
        return weekCell
    }
}

extension TeacherWeekdayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        }
    

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let collectionViewWidth = collectionView.bounds.width
            return CGSize(width: collectionViewWidth/2.5, height: collectionViewWidth/2.5)
//            return CGSize(width: 167, height: 167)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
}
