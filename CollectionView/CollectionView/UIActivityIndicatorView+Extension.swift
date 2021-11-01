//
//  UIActivityIndicatorView+Extension.swift
//  Reddit
//
//  Created by rave on 10/15/21.
//


import UIKit

extension UIActivityIndicatorView {
    
    func showSpinner(_ view: UIView) {
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        startAnimating()
    }
}
