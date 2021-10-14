//
//  ViewController.swift
//  SeanCoordinatorProject
//
//  Created by Sean Jones on 10/14/21.
//

import UIKit

protocol ViewControllerDelegate {
    func done(word: String)
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - PROPERTIES
    
    var delegate: ViewControllerDelegate?
    var word: String?
    
    //MARK: - OUTLETS
    @IBOutlet weak var firstWordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstWordTextField.delegate = self
    }
    
    //MARK: - ACTIONS
    
    static func create() -> ViewController {
        
        let controller = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "VCVC") as! ViewController
        return controller
    }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        guard let first = firstWordTextField.text else {return}
        self.word = first
        
        delegate?.done(word: word!)
    }
    
}

