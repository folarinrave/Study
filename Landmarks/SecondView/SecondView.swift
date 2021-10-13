//
//  SecondView.swift
//  Landmarks
//
//  Created by Yevgeniy Ivanov on 10/12/21.
//

import UIKit

protocol SecondViewDelegate {
    func addCell(_ cellValue: String)
}

class SecondView : UIViewController, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var arrString: [String] = ["This", "Is", "My", "Test", "String"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension SecondView : UITextFieldDelegate {
    func addCell(_ cellValue: String) {
        arrString.append(cellValue)
    }
    
    
}

extension SecondView : UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrString.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = arrString[indexPath.row].description
        return cell
    }
    
    
}
