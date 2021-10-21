//
//  SecondViewController.swift
//  TableViewDelegation
//
//  Created by Limei  Chen on 10/13/21.
//

import UIKit
protocol Add {
    func AddNameToTable()
}

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var studentName: UILabel!
    
    var student: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentName.text = student

    }
    
}
