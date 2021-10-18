//
//  MainCoordinator.swift
//  coordinator_youtube
//
//  Created by rave on 10/16/21.
//

import UIKit

class MainCoordinator: Coordinator{
    var navigationController: UINavigationController?
   
    func eventOccurred(with type: Event, identifierStr: String) {
        print ("identifierStr: \(identifierStr)")
    switch identifierStr{
  
        
    case "FirstVC" :
        do {
           
            print("first Event occured")
            var vc:UIViewController & Coordinating = SecondVC()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: false)
            
        }
    case "SecondVC" :
        do {
           
            print("second Event occured")
            var vc:UIViewController & Coordinating = ThirdVC()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: false)
            
        }
    case "ThirdVC" :
        do {
           
            print("Third Event occured")
        
            var vc:UIViewController & Coordinating = ViewController()
            vc.coordinator = self
            navigationController?.pushViewController(vc, animated: false)
            
        }
    case is Error:
        do {
            break
            
        }
    default: break
        
    }
        
    }
    
    func start(){
        
       var vc: UIViewController & Coordinating = ViewController()
        vc.coordinator = self
      navigationController?.setViewControllers([vc], animated: false)
    }
}
