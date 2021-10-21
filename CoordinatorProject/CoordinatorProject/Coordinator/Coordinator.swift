//
//  Coordinator.swift
//  CoordinatorProject
//
//  Created by Limei  Chen on 10/14/21.
//

import Foundation
import UIKit

class Coordinator {
    let navController: UINavigationController
    init(_ rootController: UIViewController) {
        self.navController = UINavigationController(rootViewController: rootController)
    }
}

extension Coordinator: ViewControllerDelegate {
    func goToNext() {
        let vc = UIStoryboard(name:"SecondVC", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController")  as! SecondViewController
        self.navController.pushViewController(vc, animated: true)
    }
        
}


