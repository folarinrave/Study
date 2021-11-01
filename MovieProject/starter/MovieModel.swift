//
//  MovieModel.swift
//  MovieBrowser
//
//  Created by rave on 10/29/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct MovieModel: Codable {
    let results: [Movie]
}
struct Movie: Codable {
    let overview: String
    let posterPath: String?
    let releaseDate:Date //originally a string, but custom json decoder changed it to date- see Network class
    let title: String
    let voteAverage: Double

    init()
    {
        overview = "No overview"
        posterPath = "placeholder"
        releaseDate = Date()
        title = "No title"
        voteAverage = 0
        
    }
    enum CodingKeys: String, CodingKey {
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"

    }
}

