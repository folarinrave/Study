//
//  DrinkModel.swift
//  week03assessment
//
//  Created by rave on 10/27/21.
//

import UIKit

struct DrinkModel : Codable
{
    var drinks: [DrinkChild]
}
struct DrinkChild : Codable
{
    var strDrink: String
    var strDrinkThumb : String
    var idDrink : String
}

