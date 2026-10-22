//
//  SignUpView.swift
//  WhoFedThePets
//
//  Created by Elliot Hannah III on 10/21/26.
//

import SwiftUI

struct SignUpView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var phoneNumber: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Who Fed The Pets?")
                    .font(.largeTitle.bold())
                Text("Sign Up").font(.title)
                HStack {
                    TextField("Name", text: $name, prompt: Text("Name"))
                        .disableAutocorrection(true)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.secondary.opacity(0.5), lineWidth: 1)
                        )
                        .padding(.horizontal)
                    TextField("Email", text: $email, prompt: Text("Email"))
                        .disableAutocorrection(true)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.secondary.opacity(0.5), lineWidth: 1)
                        )
                        .padding(.horizontal)
                }
                .padding(.bottom)
                HStack {
                    TextField("Username", text: $username, prompt: Text("Username"))
                        .disableAutocorrection(true)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.secondary.opacity(0.5), lineWidth: 1)
                        )
                        .padding(.horizontal)
                    TextField("Phone Number", text: $phoneNumber, prompt: Text("Phone Number"))
                        .disableAutocorrection(true)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.secondary.opacity(0.5), lineWidth: 1)
                        )
                        .padding(.horizontal)
                }
                .padding(.bottom)
                Button("Create Account") {}
                    .buttonStyle(.borderedProminent)
                Spacer()
                HStack(alignment: .bottom) {
                    Text("Already have an account?")
                    NavigationLink("Sign in") {
                        SignInView()
                    }
                    
                }
            }
        }
    }
}

#Preview {
    SignUpView()
}
