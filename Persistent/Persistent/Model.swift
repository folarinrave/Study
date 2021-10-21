//
//  Model.swift
//  Persistent
//
//  Created by Limei  Chen on 10/18/21.
//

import Foundation

struct Response: Codable {
    let kind: String
    let data: Data
    
    struct Data: Codable {
        let dist: Int
        let children: [Children]
        
        struct Children:  Codable {
            let data: nestedData
            
            struct nestedData: Codable {
                let subreddit: String
                let title: String
                let score: Int
            }
        }
    }
    
}
