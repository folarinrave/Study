//
//  CustomCell.swift
//  week03assessment
//
//  Created by rave on 10/23/21.
//

import UIKit

class JokeCell: UITableViewCell {

    @IBOutlet weak var URLLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var IDLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
