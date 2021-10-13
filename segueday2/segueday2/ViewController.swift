//
//  ViewController.swift
//  segueday2
//
//  Created by Nathaniel Patterson on 10/13/21.
//

import UIKit

protocol viewControllerDelegate {
    func addToList(name:String)
}
class ViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    
    var data: [String] = ["Nathan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        
        let secondVC = SecondViewController()
        secondVC.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        table.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }

}


extension ViewController: viewControllerDelegate {
    func addToList(name:String){
        print("laYeet")
        self.data.append(name)
    }
}
// Segue extensions
extension ViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! SecondViewController
        if let index = table.indexPathForSelectedRow?.row {
            destinationVC.name = data[index]
            destinationVC.delegate = self
        }
        
    }
}
