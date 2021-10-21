//
//  ViewController.swift
//  coordinator_youtube
//
//  Created by rave on 10/16/21.
//

import UIKit

class ViewController: UIViewController, Coordinating{
    var coordinator: Coordinator?
    
 
    
    
    @IBOutlet weak var FirstVCButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Home"
        view.backgroundColor = .white

    
    }

    @IBAction func FirstVCButtonClicked(_ sender: Any) {
        
        print("button clicked")
        coordinator?.eventOccurred(with: .buttonTapped, identifierStr: "FirstVC")
    }
    

}

