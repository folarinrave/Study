//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by rave on 10/20/21.
//

import UIKit

// custom UICollectionViewCell class
class collectionViewCell: UICollectionViewCell{

  let cellId = "CellId"; // same as above unique id

    var titleLabel:UILabel = {
        let label = UILabel(frame: CGRect(x:5, y: 5, width: 130
                                          , height: 180))
        //label.backgroundColor = .systemYello
        label.font = label.font.withSize(17)
        label.lineBreakMode = .byWordWrapping
              label.numberOfLines = 0
    //  label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()

  override init(frame: CGRect) {
      super.init(frame: frame);
      self.addSubview(self.titleLabel)
     // self.backgroundColor = .systemRed
  }
    
  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}
