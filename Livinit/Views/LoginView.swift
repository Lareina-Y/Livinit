//
//  LoginView.swift
//  Livinit
//
//  Created by Lareina Yang on 3/6/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Logo
            Image("livinit-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            // Title
            Text("Login")
                .font(.title)
                .bold()
                .foregroundColor(.black)
            
            Text("Enter your email and password")
                .font(.body)
                .foregroundColor(.gray)
            
            // Email Input Field
            CustomTextField(icon: "envelope", placeholder: "Email Address / Mobile number", text: $email)
            
            // Password Input Field
            CustomTextField(icon: "lock", placeholder: "Password", text: $password, isSecure: true)
            
            // Forgot Password
            HStack {
                Text("Forgot your password?")
                    .font(.caption)
                    .foregroundColor(.accent)
                    .underline()
            }
            
            // Login Button
            Button(action: {
                print("Email: \(email) | Password: \(password)")
            }) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.accent)
                    .cornerRadius(30)
                    .shadow(radius: 5)
            }
            .padding(.horizontal, 30)
            
            // Sign Up Text
            HStack {
                Text("Don't have an account?")
                    .foregroundColor(.gray)
                
                NavigationLink(destination: SignupView()) {
                    Text("Sign Up")
                        .foregroundColor(.accent)
                        .bold()
                }
            }
            
            // OR Divider
            Text("OR")
                .font(.caption)
                .padding(.vertical, 5)
            
            // Social Media Login
            HStack(spacing: 30) {
                Button(action: {
                    print("Google Login")
                }) {
                    Image("google-logo")
                        .resizable()
                        .frame(width: 30, height: 30)
                }

                Button(action: {
                    print("Facebook Login")
                }) {
                    Image("facebook-logo")
                        .resizable()
                        .frame(width: 30, height: 30)
                }

                Button(action: {
                    print("Apple Login")
                }) {
                    Image("apple-logo")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
            .padding(.top, 5)
        }
    }
}

// Preview
#Preview {
    LoginView()
}
