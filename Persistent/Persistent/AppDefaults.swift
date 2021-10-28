//
//  AppDefaults.swift
//  Persistent
//
//  Created by Limei  Chen on 10/19/21.
//

import Foundation

struct AppDefault {
    enum Key: String {
        case dataTitle = ""
    }
}
extension AppDefault {
    static func set(key: Key, _ value: Int){
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
    
    static func get(_ key: Key) -> Any? {
        return UserDefaults.standard.value(forKey: key.rawValue)
    }
}
