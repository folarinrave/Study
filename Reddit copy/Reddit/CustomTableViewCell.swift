//
//  CustomTableViewCell.swift
//  Reddit
//
//  Created by Limei  Chen on 10/14/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var subredditLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
