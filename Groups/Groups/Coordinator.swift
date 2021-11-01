//
//  Coordinator.swift
//  week03assessment
//
//  Created by Luat on 10/18/21.
//

import UIKit

class Coordinator {
    var navCon = UINavigationController()
    
    /// This func is not complete
    func pushHomeVC() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = sb.instantiateViewController(identifier: "HomeVC")as! HomeViewController
        homeVC.JokesDelegate = self
        homeVC.DrinksDelegate = self
        navCon.pushViewController(homeVC, animated: true)
    }
    
    
}

extension Coordinator: JokesDelegate {
    func JokesDone() {
        
        print("JokesVCDelegated Called")
        let vc = UIStoryboard(name: "JokesVC", bundle: .main).instantiateViewController(withIdentifier: "JokesVC") as! JokesVC
        
        vc.JokesDelegate = self
        navCon.pushViewController(vc, animated: true)
        
    }
}

extension Coordinator: DrinksDelegate{
    func DrinksDone() {
        print("drinks called")
        let vc = UIStoryboard(name: "DrinksVC", bundle: .main).instantiateViewController(withIdentifier: "DrinksVC") as! DrinksVC
        
        vc.DrinksDelegate = self
        navCon.pushViewController(vc, animated: true)
        
    }
}
