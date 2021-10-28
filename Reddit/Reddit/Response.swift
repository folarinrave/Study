//
//  Response.swift
//  Reddit
//
//  Created by Daniel Brannon on 10/14/21.
//

import Foundation
import FileProvider

struct Response: Decodable {
    let data: Data
    let kind: String
    
}

struct Data: Decodable {
    let children: [Children]
}
struct Children: Decodable {
    let data: ChildrenData
}

struct ChildrenData: Decodable {
    let subreddit: String
    let title: String
    let score: Int
}
