//
//  Post.swift
//  Persistence
//
//  Created by Sean Jones on 10/18/21.
//

import Foundation

struct TopLVLObject : Decodable {
    let data: SecondLVLObject
}

struct SecondLVLObject: Decodable {
    let  children: [ThirdLVLObject]
}

struct ThirdLVLObject: Decodable {
    let data: Post
}

struct Post: Codable {
    let title: String
}
