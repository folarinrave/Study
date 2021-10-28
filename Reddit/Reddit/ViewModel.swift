//
//  ViewModel.swift
//  Reddit
//
//  Created by Limei  Chen on 10/14/21.
//

import Foundation
struct ViewModel {
    static func fetch(input:String,_ completion: @escaping(Response) ->()) {
        print("Point 1")
        if let url = URL(string: "https://reddit.com/r/\(input)/.json") {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                print("point 3")
                guard let data = data else {
                    return
                }
                print("point5")
                guard let response: Response = try? JSONDecoder().decode(Response.self, from: data) else {
                    return
                }
                completion(response)
                print("point 4")
            }.resume()
        }
        print("point 2")
    }
}
