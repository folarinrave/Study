//
//  ViewController.swift
//  Seque
//
//  Created by rave on 10/12/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate , UITableViewDelegate{

    @IBAction func myButton(_ sender: Any) {
        self.performSegue(withIdentifier: "InputVCToDisplayVC", sender: self)
    }
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var data:[String?] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.delegate = self
    }
    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
   
        //data = textField.text ?? "None"
        data.append(textField.text)
        let displayVC = segue.destination as! SecondViewController
        displayVC.data = data
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //data = textField.text ?? "Null data"
        data.append(textField.text)

        print(data)
        print ("This never got called")
        return true
    }
}

