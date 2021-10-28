//
//  DrinkModel.swift
//  week03assessment
//
//  Created by Limei  Chen on 10/21/21.
//

import Foundation
struct DrinkModel: Decodable {
    let drinks: [Drink]
}

struct Drink: Decodable {
    let strDrink: String
    let strDrinkThumb: String
    let idDrink: String
}
