//
//  ViewController.swift
//  Segue
//
//  Created by Limei  Chen on 10/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    var data: String? = ""
    @IBAction func nextButton(_ sender: UIButton) {
        performSegue(withIdentifier: "secondVC", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.delegate = self
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let destination = segue.destination as? SecondViewController {
            destination.data = [textField.text!]
        }
    }

}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        data = textField.text
        return true
    }
}

