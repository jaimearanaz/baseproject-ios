//
//  Cache.swift
//  BaseProject
//
//  Created by Jaime Aranaz on 09/03/2017.
//  Copyright © 2017 Jaime Aranaz. All rights reserved.
//

import Foundation

class Cache {
    
    static fileprivate let cacheFileName = "cache.plist"
    static fileprivate let cacheCreationFileName = "cacheCreation.plist"
    static fileprivate let cacheCreationKey = "creation"
    
    static fileprivate var expirationTimeInHours = 8
    
    // MARK: - Public methods
    
    static func writeToCache(key: String, value: Data) {
        
        deleteCacheIfExpired()
        
        var cache = readFromCache()
        cache[key] = value
        
        writeToCache(data: cache)
    }
    
    static func readFromCache(key: String) -> Data {
        
        deleteCacheIfExpired()
        
        let cache = readFromCache()
        var data = Data()
        
        if let value = cache[key] {
            data = value as Data
        }
        
        return data
    }
    
    static func deleteFromCache(key: String) {
        
        var cache = readFromCache()
        cache.removeValue(forKey: key)
        
        writeToCache(data: cache)
    }
    
    static func isInCache(key: String) -> Bool {
        
        deleteCacheIfExpired()
        
        let cache = readFromCache()
        
        if let _ = cache[key] {
            return true
        } else {
            return false
        }
    }
    
    static func clearCache() {
        
        deleteCache()
    }
    
    static func setExpirationTime(hours: Int) {
     
        expirationTimeInHours = hours
        deleteCacheIfExpired()
    }
    
    // MARK: - Private methods
    
    static fileprivate func pathToCacheFile(_ filename: String) -> String {
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let filePath = documentsPath.appending("/\(filename)")
        return filePath
    }
    
    static fileprivate func updateCreationDate() {
        
        let currentDate = Date()
        let dictionary = Dictionary(dictionaryLiteral: (cacheCreationKey, currentDate))
        let path = pathToCacheFile(cacheCreationFileName)
        NSKeyedArchiver.archiveRootObject(dictionary, toFile: path)
    }
    
    static fileprivate func deleteCacheIfExpired() {
        
        let creationPath = pathToCacheFile(cacheCreationFileName)
        let dictionary = NSKeyedUnarchiver.unarchiveObject(withFile: creationPath) as? [String : NSDate]
        let cacheDate = dictionary?.values.first
        
        let currenDate = Date()
        let expirationTimeInSeconds = expirationTimeInHours * 60 * 60
        let isExpired = cacheDate?.addingTimeInterval(TimeInterval(expirationTimeInSeconds)).compare(currenDate) == .orderedAscending
        
        if (isExpired) {
            deleteCache()
        }
    }
    
    static fileprivate func deleteCache() {
        
        let cachePath = pathToCacheFile(cacheFileName)
        let creationPath = pathToCacheFile(cacheCreationFileName)
        
        do {
            try FileManager.default.removeItem(atPath: cachePath)
            try FileManager.default.removeItem(atPath: creationPath)
        } catch _ {
            print("Error removing cache files")
        }
    }
    
    static fileprivate func readFromCache() -> [String : Data] {
        
        let path = pathToCacheFile(cacheFileName)
        let dictionary = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? [String : Data]
        
        if let dictionary = dictionary {
            return dictionary
        } else {
            return [String : Data]()
        }
    }
    
    static fileprivate func doesCacheFileExist() -> Bool {
        
        let cache = readFromCache()
        
        if (cache.count == 0) {
            return false
        } else {
            return true
        }
    }
    
    static fileprivate func writeToCache(data: [String : Data]) {
        
        if (!doesCacheFileExist()) {
            updateCreationDate()
        }
        
        let path = pathToCacheFile(cacheFileName)
        NSKeyedArchiver.archiveRootObject(data, toFile: path)
    }
}
