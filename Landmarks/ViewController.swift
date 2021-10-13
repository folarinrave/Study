//
//  ViewController.swift
//  Landmarks
//
//  Created by Yevgeniy Ivanov on 10/12/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondView" {
            if let destinationVC = segue.destination as? SecondView {
                destinationVC.addCell(textField.text ?? "")
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        performSegue(withIdentifier: "toSecondView", sender: nil)
        return false
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        textField.delegate = self
    }
}


