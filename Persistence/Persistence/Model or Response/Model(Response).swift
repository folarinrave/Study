//
//  Model.swift
//  Persistence
//
//  Created by Daniel Brannon on 10/19/21.
//

import Foundation
import FileProvider

struct Response: Decodable {
    let data: jsonData
    
}

struct jsonData: Decodable {
    let children: [Children]
    
}

struct Children: Codable {
    let data: ChildrenData
    
}
struct ChildrenData: Codable {
    let title: String
}
