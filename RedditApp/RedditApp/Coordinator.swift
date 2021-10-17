//
//  Cordinator.swift
//  RedditApp
//
//  Created by Nathaniel Patterson on 10/17/21.
//

import UIKit

class Coordinator {
    var navCon = UINavigationController()
    
    func firstVC() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let firstVC = sb.instantiateViewController(withIdentifier: "FirstVC") as? ViewController {
            firstVC.delegate = self
            navCon.pushViewController(firstVC, animated: true)
        }
    }
}
