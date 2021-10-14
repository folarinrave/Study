//
//  SecondViewController.swift
//  Delegation
//
//  Created by Freddie Perez-cruz  on 10/13/21.
//


import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func addStudent(_ student: String)
}

class SecondViewController: UIViewController, UITextFieldDelegate {
    weak var delegate: SecondViewControllerDelegate?
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    
    var student: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textLabel.text = student
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.addStudent(textField.text ?? "")
    }
}




// viewcontroller has a view
// when you add subviews like UIButton's, UITextField, UILabel etc.
// those views become the subview of the viewcontroller's view
// when viewdidload() is called, that means the viewcontroller's view
// has been loaded and all its subviews (UIButton, UITextField, UILabel)
// have been loaded. So they're now "ready to be used"

// when accessing any of the viewontroller's views before they're loaded will
// cause a crash
