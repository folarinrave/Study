//
//  Coordinator.swift
//  SeanCoordinatorProject
//
//  Created by Sean Jones on 10/14/21.
//

import Foundation
import UIKit

class Coordinator {
    let navigationController : UINavigationController
    
    init(_ rootController: UIViewController) {
        self.navigationController = UINavigationController(rootViewController: rootController)
    }
}

extension Coordinator : ViewControllerDelegate {
    func done(word: String) {
        let vc = UIStoryboard(name: "Second", bundle: .main).instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        vc.secondVCDelegate = self
        vc.firstWord = word
        navigationController.pushViewController(vc, animated: true)
    }
}

extension Coordinator: SecondViewControllerDelegate {
    func next(firstWord: String, secondWord: String) {
        let vc = UIStoryboard(name: "Third", bundle: .main).instantiateViewController(withIdentifier: "ThirdVC") as! ThirdViewController
        vc.firstWord = firstWord
        vc.secondWord = secondWord
        navigationController.pushViewController(vc, animated: true)
        
        
    }
    
}


