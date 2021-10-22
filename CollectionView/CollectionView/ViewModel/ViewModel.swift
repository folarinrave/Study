//
//  ViewModel.swift
//  Reddit
//
//  Created by Daniel Brannon on 10/21/21.
//

import Foundation


struct ViewModel {
    static func fetch(_ completion: @escaping (Response) -> Void) {
        if let url = URL(string: "https://reddit.com/r/nfl/.json") {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, error, response in
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

