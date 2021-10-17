//
//  UIActivityIndicatorView Extension.swift
//  RedditApp
//
//  Created by Nathaniel Patterson on 10/16/21.
//

import UIKit

extension UIActivityIndicatorView {
    
    func showSpinner(_ view: UIView) {
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startAnimating()
    }
}
