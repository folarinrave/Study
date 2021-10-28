//
//  ThirdViewController.swift
//  cooordi
//
//  Created by Limei  Chen on 10/21/21.
//

import Foundation

import UIKit

class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
      
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//        label.center = CGPoint(x: 300, y: 300)
        label.textAlignment = .center
        label.text = "HELLO WORLD"
        label.center = self.view.center

        self.view.addSubview(label)
    }
}
