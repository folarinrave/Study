//
//  RedditCell.swift
//  RedditApp
//
//  Created by Nathaniel Patterson on 10/15/21.
//

import UIKit

class RedditCell: UITableViewCell {
    
    var data = (s:"", t:"", score:0)

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var subredditLabel: UILabel!
    @IBOutlet weak var titleLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static let identifier = "RedditCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "RedditCell", bundle: nil)
    }
    
    public func configure(data: (s:String,t:String,score:Int)) {
        print(data)
        self.data = data
        scoreLabel.text = String(data.score)
        subredditLabel.text = data.s
        titleLable.text = data.t
    }
    
}
