//
//  SignInView.swift
//  WhoFedThePets
//
//  Created by Elliot Hannah III on 10/21/26.
//

import SwiftUI

struct SignInView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Who Fed The Pets?")
                    .font(.largeTitle.bold())
                Text("Sign In").font(.title)
                TextField("Username", text: $username, prompt: Text("Username"))
                    .disableAutocorrection(true)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.secondary.opacity(0.5), lineWidth: 1)
                    )
                    .padding(.horizontal)
                SecureField("Password", text: $password, prompt: Text("Password"))
                    .disableAutocorrection(true)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.secondary.opacity(0.5), lineWidth: 1)
                    )
                    .padding(.horizontal)
                Button("Sign In") {}
                    .buttonStyle(.borderedProminent)
                Spacer()
                HStack(alignment: .bottom) {
                    Text("Need to create an account?")
                    NavigationLink("Sign up") {
                        SignUpView()
                    }
                    
                }
                
            }
            
        }
    }
}

#Preview {
    SignInView()
}
