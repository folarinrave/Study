//
//  Model.swift
//  HaHaHa
//
//  Created by Ling on 10/18/21.
//

import Foundation



// when you're looking at your JSON object
struct childStruct: Codable
{
    var title: String
    var  url: String
}

struct Model: Codable {
    var data: Data
    struct Data: Codable {
        var dist: Int
        var children: [Children]

        struct Children: Codable
        {
            var data: childStruct
        }
        
    }
    
}



