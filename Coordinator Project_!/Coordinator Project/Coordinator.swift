//
//  Coordinator.swift
//  Coordinator Project
//
//  Created by Limei  Chen on 10/15/21.
//

import Foundation
import UIKit
enum Event {
    case buttonTapped
}

protocol Coordinator {
    var navigationController: UINavigationController? {get set}
    
    func eventOccured(with type: Event)
    func start()
}
protocol Coordinating {
    var coordinator: Coordinator? {get set}
}
