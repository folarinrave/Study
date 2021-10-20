//
//  ViewController.swift
//  Persistence
//
//  Created by Daniel Brannon on 10/19/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    var myData: [Children] = []
    var myTitle: String = "test"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seeIfFileManagerIsEmpty()
        tableView.dataSource = self
        tableView.delegate = self
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.setThis(data: myData[indexPath.row].data.title)
        return cell
    }
}

extension ViewController {
    func seeIfFileManagerIsEmpty() {
        if let myKey = ViewModel.checkFileManager(using: myTitle) {
            self.myData = try! DiskStorage.read(fromKey: self.myTitle, using: .default)
        }
        else
        {
            ViewModel.fetch(myTitle: myTitle) { response in
                
                DispatchQueue.main.async {
                    self.myData = response.data.children
                    self.tableView.reloadData()
                    let nib = UINib(nibName: "TableViewCell", bundle: nil)
                    self.tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
                    self.tableView.reloadData()
                    try? DiskStorage.save(withKey: self.myTitle, value: self.myData, using: .default)
                }
            }
        }
    }
}
