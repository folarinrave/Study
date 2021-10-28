//
//  Model.swift
//  MVVMProject
//
//  Created by Limei  Chen on 10/22/21.
//

import Foundation


struct Model: Decodable {
    let data: [Data]
    struct Data: Decodable {
        let id: Int
        let employee_name: String
    }
}
