//
//  Network.swift
//  AnimeProject
//
//  Created by Daniel Brannon on 10/29/21.
//

import Foundation

import Foundation

protocol NetworkRequest {
    func call(_ text: String)
}

struct NetworkingRequest:Decodable {
    var url = URL(string: "https://api.jikan.moe/v3/search/anime?q=naruto")
    
    func fetch(completion: @escaping (AnimeModel) -> Void) {
        if let url = url {
            URLSession.shared.dataTask(with: url) { data, r, e in
                guard let data = data else { return }
                do {
                    let decoded = try JSONDecoder().decode(AnimeModel.self, from: data)
                    completion(decoded)
                } catch {
                    print(error)
                }
            }.resume()
        }
    }
}
