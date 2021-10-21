//
//  Response.swift
//  HaHaHa
//
//  Created by Folarin Williamson on 10/14/21.
//

import Foundation



// when you're looking at your JSON object
struct childData: Decodable
{
    var subreddit:String
    var title: String
    var score: Int
}

struct Response: Decodable {
    var kind: String
    var data: Data
    
    
    
    struct Data: Decodable {
        var dist: Int
        var children: [Children]

        struct Children: Decodable
        {
            var data: childData
        }
        
    }
    
}



