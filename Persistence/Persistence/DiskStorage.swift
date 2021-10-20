//
//  DiskStorage.swift
//  Persistence
//
//  Created by Sean Jones on 10/18/21.
//

import Foundation

enum DiskStorageError: Error {
    case missingFile
    case noData
}

struct DiskStorage {
    
    static func save(withKey key: String, value: [Post], using fileManager: FileManager = .default) throws {
        let cacheDirectory = FileManager.SearchPathDirectory.cachesDirectory
        let folderURLs = fileManager.urls(for: cacheDirectory, in: .userDomainMask)
        guard let fileURL = folderURLs.first?.appendingPathComponent(key + ".cache") else {
            throw DiskStorageError.missingFile
        }
        
        print("File URL: \(fileURL)")
        let data: Data = try JSONEncoder().encode(value)
        try data.write(to: fileURL)
    }
    
    static func read(fromKey key: String, using fileManager: FileManager = .default) throws -> [Post] {
        let cacheDirectory = FileManager.SearchPathDirectory.cachesDirectory
        let folderURLs = fileManager.urls( for: cacheDirectory, in: .userDomainMask)
        
        print(folderURLs)
        
        guard let fileURL = folderURLs.first?.appendingPathComponent(key + ".cache") else { throw DiskStorageError.missingFile}
        
        print(fileURL)
        
        guard let data = fileManager.contents(atPath: fileURL.path) else { throw DiskStorageError.noData}
        
        let object = try JSONDecoder().decode([Post].self, from: data)
        return object
    }
}
