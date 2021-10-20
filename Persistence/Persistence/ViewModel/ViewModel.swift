//
//  ViewModel.swift
//  Persistence
//
//  Created by Daniel Brannon on 10/19/21.
//

import Foundation

protocol ViewModelDelegate {
    mutating func done(_ text: String)
}

struct ViewModel:Decodable {
    static func fetch(myTitle:String = "test", _ completion: @escaping (Response) -> Void) {
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


    
static func checkFileManager(using key: String) -> String? {
        guard let myKey: String = try? DiskStorage.read(fromKey: key) else {
            return nil
        }
        return myKey
    }

}
