//
//  Model.swift
//  CollectionView
//
//  Created by Daniel Brannon on 10/21/21.
//

import Foundation

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
    let title: String
    let url: String
}
