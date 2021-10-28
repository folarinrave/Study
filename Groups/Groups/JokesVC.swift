//
//  Jokes.swift
//  week03assessment
//
//  Created by rave on 10/18/21.
//

import UIKit


class JokesVC: UIViewController {
    var JokesDelegate: JokesDelegate?

    @IBOutlet weak var setupLabel: UILabel!
    
    @IBOutlet weak var deliveryLabel: UILabel!
    
    private lazy var errorAlert: UIAlertController = {
       let alert = UIAlertController(title: "Error!",
                                     message: "Something's wrong in JokesVC.",
                                     preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok",
                                   style: .cancel,
                                   handler: nil)
        alert.addAction(action)
        return alert
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        JokesViewModel.fetchJokes { result in

            print("RESULT: \(result)")


            DispatchQueue.main.async {

                switch result {
                case let .success(randomName):
                    self.setupLabel.text = randomName.setup
                    self.deliveryLabel.text = randomName.delivery
                case .failure:
                    self.present(self.errorAlert, animated: true, completion: nil)
                }

            }
        }
        
    }

    
}
