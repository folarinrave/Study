//
//  NameDetailViewController.swift
//  Sean-TableViewDelegateProject
//
//  Created by Sean Jones on 10/13/21.
//

import UIKit

protocol NewNameDelegate {
    func addName(name: String)
}



class NameDetailViewController: UIViewController, UITextFieldDelegate {

    //MARK: - PROPERTIES
    var newNameDelegate: NewNameDelegate?
    var newName: String?
    var student: String?
    
    //MARK: - OUTLETS
    
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var newNameTextField: UITextField!
   
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        studentNameLabel.text = student
        newNameTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        newNameTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = newNameTextField.text {
            let name = text
            self.newNameDelegate?.addName(name: name)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
