//
//  Response.swift
//  myCollectionView
//
//  Created by Limei  Chen on 10/20/21.
//

import Foundation


struct Model: Codable {
    let data: Data
    
    struct Data: Codable {
        let children: [Children]
        
        struct Children:  Codable {
            let data: childrenArrData
            
            struct childrenArrData: Codable {
                let title: String
                let url: String
        
            }
        }
    }
    
}
