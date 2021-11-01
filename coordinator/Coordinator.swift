//
//  Coordinator.swift
//  coordinator_youtube
//
//  Created by rave on 10/16/21.
//

import UIKit

enum Event
{
    case buttonTapped
}
protocol Coordinator{
    
    var navigationController: UINavigationController? {get set}
    
    func eventOccurred(with type: Event, identifierStr: String)
    func start()
    
}

protocol Coordinating {
    var coordinator:Coordinator? {get set}
    
}
