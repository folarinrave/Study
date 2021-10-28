//
//  SecondViewController.swift
//  cooordi
//
//  Created by Limei  Chen on 10/21/21.
//

import Foundation
import UIKit


protocol SecondViewControllerDelegate {
    func goToThird()
}

class SecondViewController: UIViewController {
    
    var delegate: SecondViewControllerDelegate?

    @IBAction func buttonTapped(_ sender: UIButton) {
       
        delegate?.goToThird()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
    }
}
