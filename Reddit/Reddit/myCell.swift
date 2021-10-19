//
//  myCell.swift
//  Reddit
//
//  Created by Daniel Brannon on 10/17/21.
//

import UIKit

class myCell: UITableViewCell {

    
    @IBOutlet weak var subreddit: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var score: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "myCell", bundle: nil)
    }
    func setSubreddit(data: String) {
        subreddit.text = data
    }
    func setTitle(data: String) {
        title.text = data
    }
    func setScore(data:Int) {
        score.text = String(data)
    }
}
