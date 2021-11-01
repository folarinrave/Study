//
//  ViewModel.swift
//  Persistence
//
//  Created by Ling on 10/18/21.
//

import Foundation

enum RedditError: Error {
    case parse
}

typealias RedditResponse = Result<Model, RedditError>

struct ViewModel {
    
    // @escaping = the closure '() -> Void' will be called
    // at a later point in time after the function returns/completes
    
    // closures are like functions but you can easily create them on the fly
    // and pass them around. Used all the time for asynchronous taks such as:
    // 1) network requests 2) communicating between objects like delegates
    
    static func fetch(_ completion: @escaping (RedditResponse) -> Void, searchURL:String) {
        //print("function entered") // point 1
        
        // if let url = URL(string: "https://reddit.com/r/nfl/.json") {
        if let url = URL(string: searchURL) {
            
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request) { data, error, response in
                // print("response completed") // point 3
                
                // data = raw data
                guard let data = data else {
                    
                    return
                }
                
                // try? = the decoding may error out, if it does
                guard let response: Model = try? JSONDecoder().decode(Model.self, from: data) else {
                    return
                }
                completion(.success(response))
                //  completion(.failure(.parse))
                
                //print("closure called") // point 4
            }.resume()
        }
        
        //print("function returns to caller") // point 2
    }
}

struct DateConverter {
    static func convert(_ date: Date) -> String {
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "en_US")
        formatter.setLocalizedDateFormatFromTemplate("MMMMd")
        return formatter.string(from: date)
    }
}
