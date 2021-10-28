//
//  SecondViewController.swift
//  CoordinatorProject
//
//  Created by Limei  Chen on 10/14/21.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    var text: String?
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
//        if let receivedText = text {
//            textLabel.text = receivedText
//    }
//    @IBAction func goNextButton(_ sender: UIButton) {
//    }
}

//extension SecondViewController: ViewControllerDelegate {
//    func goToNext() {
//        let vc = UIStoryboard(name:"ThirdVC", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController")  as! ThirdViewController
//        self.SecondViewController.pushViewController(vc, animated: true)
//    }
//
    
}
