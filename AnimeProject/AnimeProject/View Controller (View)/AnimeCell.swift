//
//  AnimeCell.swift
//  AnimeProject
//
//  Created by Daniel Brannon on 10/29/21.
//

import UIKit

class AnimeCell: UITableViewCell {

    @IBOutlet weak var animeName: UILabel!
    @IBOutlet weak var episodes: UILabel!
    @IBOutlet weak var synopsis: UILabel!
    @IBOutlet weak var coverArt: UIImageView!
    
    func configure(model: Anime?) {
        guard let model = model else { return }
        animeName.text = model.title
        episodes.text = String(model.episodes)
        synopsis.text = model.synopsis
    }
    static let identifier = String(describing: AnimeCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var onReuse: () -> Void = {}
    
    override func prepareForReuse() {
        super.prepareForReuse()
        /// Removes previous (outdated) running tasks
        onReuse()
        coverArt.image = nil
    }
}
