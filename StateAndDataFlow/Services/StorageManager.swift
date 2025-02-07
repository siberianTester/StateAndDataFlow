//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Yaroslav Malygin on 07.02.2025.
//

import Foundation

final class StorageManager {
    enum Keys {
        static let userName = "userName"
        static let isLoggedIn = "isLoggedIn"
    }
    
    static func clearUserData() {
        UserDefaults.standard.removeObject(forKey: Keys.userName)
        UserDefaults.standard.removeObject(forKey: Keys.isLoggedIn)
    }
}
