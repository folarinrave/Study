//
//  DrinksViewModel.swift
//  week03assessment
//
//  Created by Limei  Chen on 10/21/21.
//

import Foundation

struct DrinksViewModel {
    static func fetchDrinks(_ completion: @escaping(DrinkModel) ->()) {
        
        if let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Rum") {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    return
                }
                guard let decodedDrinkModel: DrinkModel = try? JSONDecoder().decode(DrinkModel.self, from: data) else {
                    return
                }
                completion(decodedDrinkModel)
            }.resume()
        }
    }
}
