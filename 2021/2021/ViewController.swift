//
//  ViewController.swift
//  2021
//
//  Created by Daniel Brannon on 10/13/21.
//

import UIKit

extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? SecondViewController
        if let index = tableView.indexPathForSelectedRow?.row {
            controller?.student = students[index]
            controller?.delegate = self
        }
    }
}

class ViewController: UIViewController {
    
    var students: [String] = ["Daniel", "Freddie", "Olivia"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let secondController = UIStoryboard.init(name:"Main", bundle: .main).instantiateViewController(withIdentifier: "Second View Controller")
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var student = students[indexPath.row]
    }
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        let student = students[indexPath.row]
        cell.textLabel?.text = student
        return cell
    }
   
    
    
}

extension ViewController: SecondViewControllerDelegate {
    func done(_ text: String) {
        students.append(text)
    }
    
    
}
