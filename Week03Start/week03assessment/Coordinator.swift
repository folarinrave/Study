//
//  Coordinator.swift
//  week03assessment
//
//  Created by Luat on 10/18/21. Olivia
//

import UIKit

class Coordinator {
    var navCon = UINavigationController()
    
    
    /// This func is not complete
    func pushHomeVC() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let homeVC = sb.instantiateViewController(identifier: "HomeVC") as? HomeViewController {
            homeVC.delegate = self
            navCon.pushViewController(homeVC, animated: true)
        }
    }
//
    
}
extension Coordinator: HomeViewControllerDelegate {
    func goToJokes() {
        let vc = UIStoryboard(name: "JokesVC", bundle: .main).instantiateViewController(withIdentifier: "JokesVC") as! JokesViewController
        navCon.pushViewController(vc, animated: true)
    }
    
    func goToDrinks() {
        let vc = UIStoryboard(name: "DrinksVC", bundle: .main).instantiateViewController(withIdentifier: "DrinksVC") as! DrinksViewController
        navCon.pushViewController(vc, animated: true)
    }
    
}


