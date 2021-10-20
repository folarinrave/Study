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

struct Children: Decodable {
    let data: ChildrenData
    
}
struct ChildrenData: Decodable {
    let title: String
}
