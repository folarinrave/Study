//
//  Model.swift
//  Persistent
//
//  Created by Limei  Chen on 10/18/21.
//

import Foundation

struct Model: Codable {
    let data: Data
    
    struct Data: Codable {
        let children: [Children]
        
        struct Children:  Codable {
            let data: nestedData
            
            struct nestedData: Codable {
                let title: String
            }
        }
    }
    
}
