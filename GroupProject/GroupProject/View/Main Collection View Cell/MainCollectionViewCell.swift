//
//  MainCollectionViewCell.swift
//  GroupProject
//
//  Created by Daniel Brannon on 11/2/21.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!

    static func nib() -> UINib {
        return UINib(nibName: "MainCollectionViewCell", bundle: nil)
    }
    
    func setLabel(string: String) {
        textLabel.text = string
    }
}
