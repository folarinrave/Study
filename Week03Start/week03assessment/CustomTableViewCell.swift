//
//  CustomTableViewCell.swift
//  week03assessment
//
//  Created by Limei  Chen on 10/27/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var strDrink: UILabel!
    @IBOutlet weak var strDrinkThumb: UILabel!
    @IBOutlet weak var idDrink: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
