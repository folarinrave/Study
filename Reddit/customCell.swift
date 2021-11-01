//
//  customCell.swift
//  CustomView
//
//  Created by rave on 10/10/21.
//

import UIKit

class customCell: UITableViewCell {
    @IBOutlet weak var scoreTextView: UITextView!
    
    @IBOutlet weak var titleTextLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
