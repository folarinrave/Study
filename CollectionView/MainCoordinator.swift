//
//  MainCoordinator.swift
//  coordinator_youtube
//
//  Created by rave on 10/16/21.
//

import UIKit

class MainCoordinator: Coordinator{
    var navigationController: UINavigationController?
    
    func eventOccurred(with type: Event, urlStr: String, titleStr: String) {
        // print ("EVENT OCCURRED CALLED, urlStr: \(urlStr)")
        let vc = WebViewController()
        
        vc.urlStr = urlStr
        vc.titleStr = titleStr
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: false)
        
    }
    
    func start(){
        
        var vc: UIViewController & Coordinating = ViewController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
}
