//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 22.04.2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(ContentViewViewModel.self) var contentViewVM
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        VStack {
            Text("Hi, \(loginViewVM.name)")
                .font(.title)
                .padding(.top, 100)
            
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            ButtonView()
            
            Spacer()
            
            LogoutView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(ContentViewViewModel())
        .environmentObject(LoginViewViewModel())
}

struct ButtonView: View {
    @Environment(ContentViewViewModel.self) var contentViewVM
    
    var body: some View {
        Button(action: contentViewVM.startTimer) {
            Text(contentViewVM.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .clipShape(.rect(cornerRadius: 20))
        .overlay (
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}

struct LogoutView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        Button(action: logout) {
            Text("LogOut")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
        }
        .frame(width: 200, height: 60)
        .background(.tint)
        .clipShape(.rect(cornerRadius: 20))
        .overlay (
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
        .padding(.bottom, 50)
    }
    
    private func logout() {
        loginViewVM.logout()
    }
}
