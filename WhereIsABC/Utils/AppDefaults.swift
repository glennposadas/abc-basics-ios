//
//  AppDefaults.swift
//  WhereIsABC
//
//  Created by Glenn Posadas on 12/17/20.
//

import Foundation

/// Keep markers alphabetically arranged for easier viewing.
enum AppDefaultsKey: CodingKey {
    case useZed
}

/// The class that has multiple class functions for handling defaults.
class AppDefaults {
    
    // MARK: - Functions
    
    /// Stores object.
    class func store<T: Encodable>(_ object: T, key: AppDefaultsKey) {
        let encoder = JSONEncoder()
        let encoded = try? encoder.encode(object)
        
        if encoded == nil {
            UserDefaults.standard.set(object, forKey: key.stringValue)
            return
        }
        
        UserDefaults.standard.set(encoded, forKey: key.stringValue)
    }
    
    /// Removes the object token
    class func removeDefaultsWithKey(_ key: AppDefaultsKey) {
        UserDefaults.standard.removeObject(forKey: key.stringValue)
    }
    
    /// Returns stored object (optional) if any.
    class func getObjectWithKey<T: Decodable>(_ key: AppDefaultsKey, type: T.Type) -> T? {
        if let savedData = UserDefaults.standard.data(forKey: key.stringValue) {
            let object = try? JSONDecoder().decode(type, from: savedData)
            return object
        }
        
        return UserDefaults.standard.object(forKey: key.stringValue) as? T
    }
}
