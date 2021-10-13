//
//  ViewController.swift
//  SegueProject
//
//  Created by Freddie Perez-cruz  on 10/12/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
 
    var text = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func next(_ sender: Any) {
        self.text = textField.text!
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SecondViewController
        vc.data = self.text
     }


}

