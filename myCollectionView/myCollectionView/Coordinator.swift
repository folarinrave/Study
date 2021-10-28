//
//  Coordinator.swift
//  myCollectionView
//
//  Created by Limei  Chen on 10/20/21.
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
    func goToNext(address: String) {
        let vc = UIStoryboard(name:"WebViewController", bundle: nil).instantiateViewController(withIdentifier: "WebViewController")  as! WebViewController
        vc.links = address
        self.navController.pushViewController(vc, animated: true)
    }
        
}



