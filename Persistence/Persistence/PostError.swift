//
//  PostError.swift
//  Persistence
//
//  Created by Sean Jones on 10/18/21.
//

import Foundation

enum PostError : LocalizedError{
    case thrown(Error)
    case invalidURL
    case noData
    case badData
    
    var errorDescription: String?{
        switch self{
        case .thrown(let error):
            return error.localizedDescription
        case .invalidURL:
            return "Unable to Reach Server"
    
        case .noData:
            return "Server Responded with No Data"
        case .badData:
            return "Server Responded with Bad Data"
        
        }
        
    }
}
