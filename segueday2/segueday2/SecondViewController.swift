//
//  SecondViewController.swift
//  segueday2
//
//  Created by Nathaniel Patterson on 10/13/21.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textInputField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    var name: String = ""
    var delegate: viewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameLabel.text = name
        self.textInputField.delegate = self
    }
    
    func textFieldShouldReturn(_ textInputField: UITextField) -> Bool {
        if textInputField.text != nil {
            delegate?.addToList(name: textInputField.text!)
            textInputField.text = ""
        }
        print("test")
        return true
    }

    

}
