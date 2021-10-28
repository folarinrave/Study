//
//  ViewController.swift
//  PracticeCoordinator
//
//  Created by Limei  Chen on 10/21/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func create() -> ViewController {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController
        return controller
    }


}

