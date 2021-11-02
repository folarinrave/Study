//
//  ViewController.swift
//  Delegation
//
//  Created by Daniel Brannon on 10/26/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func buttonPressed(_ sender: Any) {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
