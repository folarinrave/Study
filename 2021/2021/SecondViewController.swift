//
//  SecondViewController.swift
//  2021
//
//  Created by Daniel Brannon on 10/13/21.
//

import UIKit

protocol SecondViewControllerDelegate {
     func done(_ text: String)
}

class SecondViewController: UIViewController {
     
     var NewStudent:String? = ""
     var student: String?
     var delegate: SecondViewControllerDelegate?
     
     @IBOutlet weak var studentLabel: UILabel!
     @IBOutlet weak var newStudent: UITextField!
     
    override func viewDidLoad() {
         super.viewDidLoad()
         studentLabel.text = student
         newStudent.delegate = self
    }
}

extension SecondViewController: UITextFieldDelegate {
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          NewStudent = textField.text
          delegate?.done(NewStudent ?? "")
          return true
     }
     
   
}
