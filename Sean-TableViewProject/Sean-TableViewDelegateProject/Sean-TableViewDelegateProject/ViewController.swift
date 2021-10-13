//
//  ViewController.swift
//  Sean-TableViewDelegateProject
//
//  Created by Sean Jones on 10/13/21.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - PROPERTIES
    
    var students = ["Freddie", "Daniel", "Olivia", "Ling", "Nathan","Yev", "Sean"]
    
    
    
    //MARK: - OUTLETS
    @IBOutlet weak var studentTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentTableView.delegate = self
        studentTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        studentTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toNameDetail", sender: nil)
    }
    
    //MARK: - NAVIGATION
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNameDetail" {
            if let destinationVC = segue.destination as? NameDetailViewController {
                if let indexPath = studentTableView.indexPathForSelectedRow {
                    let student = students[indexPath.row]
                    destinationVC.student = student
                    destinationVC.newNameDelegate = self
                    
                    
                }
            }
            
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        let student = students[indexPath.row]
        cell.textLabel?.text = student
        return cell
    }
    
    
    
}

extension ViewController: NewNameDelegate {
    func addName(name: String) {
        self.students.append(name)
    }
    
    
}

