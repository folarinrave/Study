//
//  ViewModel.swift
//  myCollectionView
//
//  Created by Limei  Chen on 10/20/21.
//

import Foundation


struct ViewModel {
    static func fetch(_ completion: @escaping(Model) ->()) {
        if let url = URL(string: "https://reddit.com/r/nfl/.json") {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    return
                }
                guard let response: Model = try? JSONDecoder().decode(Model.self, from: data) else {
                    return
                }
                completion(response)
            }.resume()
        }
    }

}
