//
//  ViewModel.swift
//  Reddit
//
//  Created by Daniel Brannon on 10/14/21.
//

import Foundation

protocol ViewModelDelegate {
    mutating func done(_ text: String)
}

struct ViewModel:Decodable {
    static func fetch(subReddit:String = "nfl", _ completion: @escaping (Response) -> Void) {
        if let url = URL(string: "https://reddit.com/r/\(subReddit)/.json") {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, error, response in
                guard let data = data else {
                    return
                }
                guard let response: Response = try? JSONDecoder().decode(Response.self, from: data) else {
                    return
                }
//                print(response)
                completion(response)
                
            }.resume()
            
        }
    }
}

