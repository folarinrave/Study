//
//  SecondViewController.swift
//  Segue
//
//  Created by Limei  Chen on 10/12/21.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var tableview: UITableView!
    var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let dataToDisplay = data.first {
            displayLabel.text = dataToDisplay
        }
        tableview.dataSource = self

    }
}

extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = data.first
        return cell
    }
    
}
