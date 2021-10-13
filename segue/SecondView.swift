//
//  SecondView.swift
//  segue
//
//  Created by Nathaniel Patterson on 10/13/21.
//

import UIKit

protocol delegateSecondView {
    func addName(nameToAdd: [String])
    func printHello()
}

class SecondView: UIViewController, UITableViewDelegate, UITableViewDataSource, delegateSecondView {
    func addName(nameToAdd: [String]) {
        names = nameToAdd
    }
    func printHello() {
        print("hello world")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    var delegate: delegateSecondView?
    var names: [String] = []
    var name: String = ""
    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        print(names)
    }


}

