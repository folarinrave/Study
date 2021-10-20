//
//  TableViewCell.swift
//  Persistence
//
//  Created by Daniel Brannon on 10/19/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var setThis: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    
    func setThis(data: String) {
        setThis.text = data
    }
}
