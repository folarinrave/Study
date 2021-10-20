//
//  FileManager.swift
//  Persistence
//
//  Created by Daniel Brannon on 10/19/21.
//

import Foundation
enum DiskStorageError: Error {
    case missingFile
    case noData

}


struct DiskStorage {
    
    static func save(withKey key: String, value: [Children], using fileManager: FileManager = .default) throws {
        let cacheDirectory = FileManager.SearchPathDirectory.cachesDirectory
        let folderURLs = fileManager.urls(for: cacheDirectory, in: .userDomainMask)
        print(folderURLs)
        guard let fileURL = folderURLs.first?.appendingPathComponent(key + ".cache") else {
            throw DiskStorageError.missingFile
        }
        
        let data: Data = try JSONEncoder().encode(value)
        try data.write(to: fileURL)
    }
    
    static func read(fromKey key: String, using fileManager: FileManager = .default) throws -> [Children] {
        
        let cacheDirectory = FileManager.SearchPathDirectory.cachesDirectory
        let folderURLs = fileManager.urls(for: cacheDirectory, in: .userDomainMask)

        guard let fileURL = folderURLs.first?.appendingPathComponent(key + ".cache") else {
            throw DiskStorageError.missingFile
        }

        guard let data = fileManager.contents(atPath: fileURL.path) else {
            throw DiskStorageError.noData
        }
        
        let object = try JSONDecoder().decode([Children].self, from: data)
        return object
    }
}

