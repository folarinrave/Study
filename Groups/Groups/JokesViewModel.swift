//
//  JokesViewModel.swift
//  week03assessment
//
//  Created by rave on 10/27/21.
//


import UIKit

enum JokeError: Error {
    case parse
}

typealias JokeResponse = Result<JokeModel, JokeError>



struct JokesViewModel {
    
    // @escaping = the closure '() -> Void' will be called
    // at a later point in time after the function returns/completes
    
    // closures are like functions but you can easily create them on the fly
    // and pass them around. Used all the time for asynchronous taks such as:
    // 1) network requests 2) communicating between objects like delegates
    
    static func fetchJokes(_ completion: @escaping (JokeResponse) -> Void) {
        print("fetching jokes") // point 1
    
    if let url = URL(string: "https://v2.jokeapi.dev/joke/Any?type=twopart") {
     
            let request = URLRequest(url: url)
                            
            URLSession.shared.dataTask(with: request) { data, res, err in
              // print("response completed") // point 3
                
                // data = raw data
                guard let data = data else {
    
                    return
                }
                
                // try? = the decoding may error out, if it does
                guard let response: JokeModel = try? JSONDecoder().decode(JokeModel.self, from: data) else {
                    return
                }
             completion(.success(response))
               // completion(.failure(.parse))
             
               // print("closure called") // point 4
            }.resume()
        }
        
//
        print("function returns to caller") // point 2
    }
 
}
