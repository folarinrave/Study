//
//  ViewModel.swift
//  RedditApp
//
//  Created by Nathaniel Patterson on 10/15/21.
//

import Foundation


class ViewModel {
    static func fetch(subreddit:String, _ completion: @escaping ([ChildrenData]) -> Void) {
        
        if let url = URL(string: "https://reddit.com/r/\(subreddit)/.json") {
            let request = URLRequest(url: url)
                            
            URLSession.shared.dataTask(with: request) { data, error, response in
                guard let data = data else {
                    return
                }
                
                guard let response: Response = try? JSONDecoder().decode(Response.self, from: data) else {
                    return
                }
                completion(response.data.children)
            }.resume()
        }
    }
}
