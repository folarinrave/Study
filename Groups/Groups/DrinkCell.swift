//
//  DrinkCell.swift
//  week03assessment
//
//  Created by rave on 10/27/21.
//

import UIKit

class DrinkCell: UITableViewCell {

    @IBOutlet weak var drinkNameLabel: UILabel!
    
    
    @IBOutlet weak var drinkURLLabel: UILabel!
    
    @IBOutlet weak var drinkIDLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
