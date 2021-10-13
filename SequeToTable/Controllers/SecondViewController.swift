//
//  SecondViewController.swift
//  Seque
//
//  Created by rave on 10/12/21.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    @IBOutlet weak var tableView: UITableView!
    

    
    var data:[String?] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        //tableView.delegate = self
        
    
    }
    //    let cell = UITableViewCell() //was told not to do this, use cell dequeReusableCell instead and register it
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
      // let cell = UITableViewCell()
     let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      
        print("this got called: \(String(describing: data))")
        cell.textLabel!.text = data[indexPath.row]
       
        return cell
    }
}
