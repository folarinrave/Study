//
//  PostController.swift
//  Persistence
//
//  Created by Sean Jones on 10/18/21.
//

import Foundation
import UIKit

class PostController {
    private static let baseURL = URL(string:"https://www.reddit.com/r/tifu")
    private static let jsonExtension: String = "json"
    
    static func fetchPosts(completion: @escaping (Result<[Post], PostError>) -> Void){
        
        guard let baseURL = baseURL else { return completion(.failure(.invalidURL))}
        let finalURL = baseURL.appendingPathExtension(jsonExtension)
        
        URLSession.shared.dataTask( with: finalURL) { (data, _, error) in
            if let error = error {
                
            }
            
            guard let data = data else { return completion(.failure(.noData))}
            do{
                let decoder = JSONDecoder()
                let topLVLObject = try decoder.decode(TopLVLObject.self, from: data)
                let secondLVLObject = topLVLObject.data
                let thirdLVLObjects = secondLVLObject.children
                
                var placeHolderArray: [Post] = []
                
                for object in thirdLVLObjects {
                    placeHolderArray.append(object.data)
                }
                return completion(.success(placeHolderArray))
            } catch {
                print(error, error.localizedDescription)
                return completion(.failure(.thrown(error)))
            }
        }.resume()
    }
}
