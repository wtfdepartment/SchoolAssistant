//
//  HomeTaskViewController.swift
//  SchoolAssistant
//
//  Created by Александра on 19.03.23.
//

import UIKit

class HomeTaskViewController: UIViewController {

    @IBOutlet weak var homeTaskTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTaskTableView.dataSource = self

    }
    


}

extension HomeTaskViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTaskTableViewCell.self), for: indexPath)
        guard let taskCell = cell as? HomeTaskTableViewCell else { return cell }
        return taskCell
    }
    
    
}
