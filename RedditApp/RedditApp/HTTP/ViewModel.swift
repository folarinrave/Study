//
//  ViewModel.swift
//  RedditApp
//
//  Created by Nathaniel Patterson on 10/15/21.
//

import Foundation

enum RedditError: Error {
    case parse
}

typealias RedditResponse = Result<[ChildrenData], RedditError>

class ViewModel {
    static func fetch(subreddit:String, _ completion: @escaping (RedditResponse) -> Void) {
        
        if let url = URL(string: "https://reddit.com/r/\(subreddit)/.json") {
            let request = URLRequest(url: url)
                            
            URLSession.shared.dataTask(with: request) { data, error, response in
                guard let data = data else {
                    return
                }
                
                guard let response: Response = try? JSONDecoder().decode(Response.self, from: data) else {
                    completion(.failure(.parse))
                    return
                }
                print(response)
                completion(.success(response.data.children))
            }.resume()
        }
    }
}
