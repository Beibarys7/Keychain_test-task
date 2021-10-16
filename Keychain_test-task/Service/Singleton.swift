//
//  Singleton.swift
//  Keychain_test-task
//
//  Created by Beibarys Shaggy on 15.10.2021.
//

import KeychainAccess

enum KeychainKey: String {
    case isUserLogin
}

final class Singleton {
    static let shared = Singleton()
    
    var keychain: Keychain {
        Keychain()
    }
    
    private init() {}
    
    // MARK: CRUD
    func save(_ value: String, forKey key: KeychainKey) {
        keychain[key.rawValue] = value
    }
    
    func removeValue(forKey key: KeychainKey) {
        keychain[key.rawValue] = nil
    }
    
    func getValue(forKey key: KeychainKey) -> String? {
        keychain[key.rawValue]
    }
}
