//
//  ViewModel.swift
//  Reddit
//
//  Created by Limei  Chen on 10/18/21.
//

import Foundation



struct ViewModel {
    static func fetch(_ completion: @escaping(Response) ->()) {
        if let url = URL(string: "https://reddit.com/r/soccer/.json") {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    return
                }
                guard let response: Response = try? JSONDecoder().decode(Response.self, from: data) else {
                    return
                }
                completion(response)
            }.resume()
        }
    }

}
