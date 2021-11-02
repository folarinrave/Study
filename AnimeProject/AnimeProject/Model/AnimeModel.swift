//
//  AnimeModel.swift
//  AnimeProject
//
//  Created by Daniel Brannon on 10/29/21.
//

import Foundation
import FileProvider

struct AnimeModel: Codable {
    let results: [Anime]
}
struct Anime: Codable {
    
    let episodes: Int
    let title: String
    let synopsis: String
    let image_url: String
}
