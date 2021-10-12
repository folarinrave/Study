//
//  ViewController.swift
//  SeanJones_SegueProblem
//
//  Created by Sean Jones on 10/12/21.
//

import UIKit

protocol TextInputsDelegate {
    func addInput(input: String)
}

class ViewController: UIViewController {

    var input: String?
    var inputDelegate: TextInputsDelegate?
    
    @IBOutlet weak var entryTextField: UITextField!
    @IBOutlet weak var completeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }

    @IBAction func completeButtonPressed(_ sender: Any) {
        if let entryText = entryTextField.text {
            self.input = entryText
            print(input)
        }
        
        performSegue(withIdentifier: "ToSecondPage", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToSecondPage" {
        if let destinationVC = segue.destination as? SecondPageViewController {
            destinationVC.textInputs.append(input!)

        }
    }
    }
}


