//
//  CustomCollectionViewCell.swift
//  myCollectionView
//
//  Created by Limei  Chen on 10/20/21.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var titleLabel:UILabel = {
        let label = UILabel(frame: CGRect(x:0, y: 5, width: 130, height: 180))
        label.font = label.font.withSize(17)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
