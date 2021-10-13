//
//  ViewController.swift
//  segue
//
//  Created by Nathaniel Patterson on 10/13/21.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBAction func toSecondView(_ sender: Any) {
        performSegue(withIdentifier: "toSecondView", sender: nil)
    }

    
    
    var namesToSend: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.textField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        namesToSend.append(textField.text ?? "")
        textField.text = ""
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondView" {
            print("Its Working")
            let destinationVC = segue.destination as! SecondView
            
            destinationVC.addName(nameToAdd: namesToSend)
        }
    }

}

