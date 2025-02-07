//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    @FocusState private var isFocused: Bool
    
    private var textColor: Color {
        if loginViewVM.name.count >= 3 {
            return .green
        } else if isFocused {
            return .red
        } else {
            return .black
        }
    }
    
    var body: some View {
        VStack {
            ZStack {
                TextField("Enter your name", text: $loginViewVM.name)
                    .multilineTextAlignment(.center)
                    .focused($isFocused)
                
                HStack {
                    Spacer()
                    Text("\(loginViewVM.name.count)")
                        .foregroundStyle(textColor)
                        .padding(.trailing, 40)
                }
                
                
            }
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
            }
            .disabled(loginViewVM.name.count < 3)
        }
    }
    
    private func login() {
        if loginViewVM.name.count >= 3 {
            loginViewVM.isLoggedIn.toggle()
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
