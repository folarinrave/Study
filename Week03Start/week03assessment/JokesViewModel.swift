//
//  ViewModel.swift
//  week03assessment
//
//  Created by Limei  Chen on 10/18/21.
//

import Foundation

struct JokesViewModel {
    static func fetchJokes(_ completion: @escaping(JokeModel) ->()) {
        
        if let url = URL(string: "https://v2.jokeapi.dev/joke/Any?type=twopart") {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    return
                }
                guard let decodedJokeModel: JokeModel = try? JSONDecoder().decode(JokeModel.self, from: data) else {
                    return
                }
                completion(decodedJokeModel)
            }.resume()
        }
    }
}
