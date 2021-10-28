//
//  ViewController.swift
//  TableViewDelegation
//
//  Created by Limei  Chen on 10/13/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data = ["Christ", "Angelina", "Michael"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}

extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? SecondViewController
        
        if let index = tableView.indexPathForSelectedRow?.row {
            destination?.student = data[index]
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var student = data[indexPath.row]
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let student = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentsCell", for: indexPath)
        cell.textLabel?.text = student
        return cell
    }
    
}
