//
//  ViewModel.swift
//  MVVMProject
//
//  Created by Limei  Chen on 10/22/21.
//

import Foundation
import UIKit

struct ViewModel {
    static func fetchEmployeeData(_ completion: @escaping(Model) ->()) {
        
        if let url = URL(string: "http://dummy.restapiexample.com/api/v1/employees") {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data else {
                    return
                }
                guard let decodedEmployeeModel: Model = try? JSONDecoder().decode(Model.self, from: data) else {
                    return
                }
                completion(decodedEmployeeModel)
            }.resume()
        }
    }
}
