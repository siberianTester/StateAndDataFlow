//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

final class LoginViewViewModel: ObservableObject {
    
    @AppStorage(StorageManager.Keys.userName) var name: String = ""
    @AppStorage(StorageManager.Keys.isLoggedIn) var isLoggedIn: Bool = false
    
    func logout() {
        StorageManager.clearUserData()
        isLoggedIn = false
        name = ""
    }
}
