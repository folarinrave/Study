//
//  customTVCell.swift
//  MovieBrowser
//
//  Created by rave on 10/29/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class customTVCell: UITableViewCell {
    
    static let identifier = String(describing: customTVCell.self)

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(model: Movie?) {
        guard let model = model else { return }
       //  date example = "2016-10-19"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, y"
        dateLabel.text = dateFormatter.string(from: model.releaseDate)
        ratingLabel.text = String(model.voteAverage)
        titleLabel.text = model.title
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  
  
    
    
}
