//
//  Network Request.swift
//  MockImageCacheProject
//
//  Created by Daniel Brannon on 10/25/21.
//

import Foundation

protocol NetworkingRequestDelegate {
    mutating func fetch(_ text: String)
}
struct NetworkingRequest:Decodable {
    
    static func fetch(_ completion: @escaping (DrinksModel) -> Void) {
        if let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail") {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, error, response in
                guard let data = data else {
                    return
                }
                guard let response: DrinksModel = try? JSONDecoder().decode(DrinksModel.self, from: data) else {
                    return
                }
                completion(response)
            }.resume()
        }
    }
}
