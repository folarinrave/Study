//
//  Drinks Model (Decodable Stuff).swift
//  MockImageCacheProject
//
//  Created by Daniel Brannon on 10/25/21.
//

import Foundation

struct DrinksModel: Codable {
    let drinks: [DrinkItem]
}

struct DrinkItem: Codable {
    enum CodingKeys: String, CodingKey {
        case drinkName = "strDrink"
        case drinkImage = "strDrinkThumb"
        case drinkId = "idDrink"
    }
    
    let drinkName: String
    let drinkImage: String
    let drinkId: String
}
