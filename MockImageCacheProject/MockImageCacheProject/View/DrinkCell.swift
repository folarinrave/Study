//
//  DrinkCellTableViewCell.swift
//  MockImageCacheProject
//
//  Created by Daniel Brannon on 10/25/21.
//

import UIKit

class DrinkCell: UITableViewCell {

    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var drinkID: UILabel!
    @IBOutlet weak var drinkImage: UIImageView!
    
    static let identifier = String(describing: DrinkCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        drinkName.text = "insert drink name here"
        drinkID.text = "insert drink ID here"
    }
    static func nib() -> UINib {
        return UINib(nibName: "DrinkCell", bundle: nil)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setName(string: String) {
        drinkName.text = string
    }
    func setId(string: String) {
        drinkID.text = string
    }
}
