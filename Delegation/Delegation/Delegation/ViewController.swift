//
//  ViewController.swift
//  Delegation
//
//  Created by Freddie Perez-cruz  on 10/13/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var students = ["Freddie", "Daniel", "Olivia", "Ling", "Nathan", "Yev", "Sean"]
    var student = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller: SecondViewController = segue.destination as! SecondViewController
        let index = tableView.indexPathForSelectedRow?.row
        controller.delegate = self
        controller.student = students[index ?? 0]
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let student = students[indexPath.row]
        cell.textLabel?.text = student
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = students[indexPath.row]
        student = data
    }
}

extension ViewController: SecondViewControllerDelegate {
    func addStudent(_ student: String) {
        students.append(student)
        tableView.reloadData()
    }
}
