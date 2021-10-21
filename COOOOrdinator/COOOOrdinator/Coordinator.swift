//
//  coordinator.swift
//  COOOOrdinator
//
//  Created by Limei  Chen on 10/17/21.
//

import Foundation
import UIKit

protocol Coordinator{
    var childCoordinators:[Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    func start()
}
