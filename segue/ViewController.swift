//
//  ViewController.swift
//  segue
//
//  Created by Nathaniel Patterson on 10/13/21.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBAction func toSecondView(_ sender: Any) {
        performSegue(withIdentifier: "toSecondView", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondView" {
            print("Its Working")
            let destinationVC = segue.destination as! SecondView
            destinationVC.name = textField.text ?? ""
        }
    }

}

