//
//  JokesViewController.swift
//  week03assessment
//
//  Created by Limei  Chen on 10/18/21.
//

import Foundation
import UIKit


class JokesViewController: UIViewController {
    @IBOutlet weak var setupLabel: UILabel!
    
    @IBOutlet weak var deliveryLabel: UILabel!
    
    
    
    var data: JokeModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JokesViewModel.fetchJokes{ response in
            self.data = response
            DispatchQueue.main.async {
                self.setupLabel.text = "Setup: \(response.setup)"
                self.deliveryLabel.text = "Delivery: \(response.delivery)"
            }
            
        }
    }

    
}
