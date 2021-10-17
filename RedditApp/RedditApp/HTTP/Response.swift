//
//  Response.swift
//  RedditApp
//
//  Created by Nathaniel Patterson on 10/15/21.
//

import Foundation

struct Response: Decodable {
    let kind: String
    let data: Data
//    let frank: String
}

struct Data: Decodable {
    let dist: Int
    let children: [ChildrenData]
}
struct ChildrenData: Decodable {
    let data: ChildrenDataData
    let kind: String
}
//
struct ChildrenDataData: Decodable {
    let subreddit: String
    let title: String
    let score: Int
}
