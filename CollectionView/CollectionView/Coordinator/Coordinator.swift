//
//  Coordinator.swift
//  CollectionView
//
//  Created by Daniel Brannon on 10/21/21.
//

import Foundation
import UIKit

class Coordinator {
    var navCon = UINavigationController()
    
    func pushHomeVC() {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let homeVC = sb.instantiateViewController(identifier: "ViewController") as? ViewController {
            homeVC.delegate = self
            navCon.pushViewController(homeVC, animated: true)
        }
    }

}

extension Coordinator : ViewControllerDelegate {
    func done(url: String) {
        let sb = UIStoryboard(name: "WebStoryboard", bundle: nil)
        if let webVC = sb.instantiateViewController(identifier: "WebViewController") as? WebViewController {
            webVC.delegate = self
            webVC.leURL = url
            navCon.pushViewController(webVC, animated: true)
        }
        
    }
    
}
