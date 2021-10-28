//
//  Response.swift
//  Reddit
//
//  Created by Limei  Chen on 10/14/21.
//

import Foundation


struct Response: Decodable {
    let kind: String
    let data: Data
    
    struct Data: Decodable {
        let dist: Int
        let children: [Children ]
        
        struct Children:  Decodable {
            let data: nestedData
            
            struct nestedData: Decodable {
                let subreddit: String
                let title: String
                let score: Int
            }
        }
    }
    
}
