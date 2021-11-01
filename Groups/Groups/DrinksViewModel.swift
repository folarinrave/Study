//
//  ViewModel.swift
//  week03assessment
//
//  Created by rave on 10/23/21.
//

import UIKit

enum DrinkError: Error {
    case parse
}

typealias DrinkResponse = Result<DrinkModel, DrinkError>









struct DrinksViewModel {
    
    // @escaping = the closure '() -> Void' will be called
    // at a later point in time after the function returns/completes
    
    // closures are like functions but you can easily create them on the fly
    // and pass them around. Used all the time for asynchronous taks such as:
    // 1) network requests 2) communicating between objects like delegates

    static func fetchDrinks(_ completion: @escaping (DrinkResponse) -> Void) {
//        print("fetching drinks ") // point 1
    
    if let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Rum") {
     
            let request = URLRequest(url: url)
                            
            URLSession.shared.dataTask(with: request) { data, res, err in
//               print("response completed") // point 3
                
                // data = raw data
                guard let data = data else {
    
                    return
                }
                
               
            //  print(" DECODED DATA: \( String(decoding: data, as: UTF8.self))")
                // try? = the decoding may error out, if it does
                guard let response: DrinkModel = try? JSONDecoder().decode(DrinkModel.self, from: data) else {
                    return
                }
                
                print( "RESPONSE: \(response.drinks)")
             completion(.success(response))
              //  completion(.failure(.parse))
             
//                print("closure called") // point 4
            }.resume()
        }
        
        //print("function returns to caller") // point 2
    }
}
