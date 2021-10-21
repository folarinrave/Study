//
//  ViewController.swift
//  CoordinatorProject
//
//  Created by Limei  Chen on 10/14/21.
//

import UIKit

protocol ViewControllerDelegate {
    func goToNext()
}

class ViewController: UIViewController {

    var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "Main"
        // Do any additional setup after loading the view.
    }
    
    static func create() -> ViewController {
        let controller = UIStoryboard(name: "Main", bundle: .main).instantiateInitialViewController() as! ViewController
        
        return controller
    }

//    @IBAction func tappedButton(_ sender: UIButton) {
//        delegate?.goToNext()
//    }
    @IBAction func nextButton(_ sender: UIButton) {
        delegate?.goToNext()
    }
    
}
