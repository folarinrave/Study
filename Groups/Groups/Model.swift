//
//  Model.swift
//  week03assessment
//
//  Created by rave on 10/27/21.
//

// MARK: - Welcome
struct Welcome: Codable {
    let drinks: [Drink]
}

// MARK: - Drink
struct Drink: Codable {
    let strDrink: String
    let strDrinkThumb: String
    let idDrink: String
}
