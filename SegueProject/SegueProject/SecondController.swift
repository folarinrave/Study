//
//  SecondController.swift
//  SegueProject
//
//  Created by Freddie Perez-cruz  on 10/12/21.
//

import UIKit


class SecondViewController: UIViewController {
    
//    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var tableViewCell: UIView!
    @IBOutlet weak var label: UILabel!
    
    var data = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        tableViewCell.text = data
        label.text = data
    }


}

