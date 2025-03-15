//
//  SignupView.swift
//  Livinit
//
//  Created by Lareina Yang on 3/6/25.
//

import SwiftUI

struct SignupView: View {
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var agreeToTerms: Bool = false
    @State private var showAlert: Bool = false
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            // Logo
            Image("livinit-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            // Title
            Text("Sign Up")
                .font(.title)
                .bold()
                .foregroundColor(.black)
            
            // Subtitle
            Text("Enter your email and password")
                .font(.body)
                .foregroundColor(.gray)
            
            // Form Fields
            // Full Name Field
            CustomTextField(
                icon: "person",
                placeholder: "Full Name",
                text: $fullName
            )
            
            // Email Field
            CustomTextField(
                icon: "envelope",
                placeholder: "Email",
                text: $email
            )
            
            // Password Field
            CustomTextField(
                icon: "lock",
                placeholder: "Password",
                text: $password,
                isSecure: true
            )
            
            // Terms and Conditions
            HStack(alignment: .center, spacing: 2) {
                Button(action: {
                    agreeToTerms.toggle()
                    print("Agree Terms and Conditions: \(agreeToTerms)")
                }) {
                    Image(systemName: agreeToTerms ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(agreeToTerms ? .accent : .gray)
                }
                .padding(.trailing, 5)
                
                Text(.init("I agree to the [Terms of Service](https://livinit.com/terms) and [Privacy Policy](https://livinit.com/privacy)"))
                    .font(.caption)
                    .foregroundColor(.gray)
                    .tint(.accent)
            }
            .padding(.top, 5)
            
            // Sign Up Button
            PrimaryButton(
                title: "Sign Up",
                action: {
                    // Handle sign up action
                    print("Sign Up Clicked")
                    // Navigate to login screen after successful registration
                    if agreeToTerms {
                        authViewModel.navigateTo(.login)
                    } else {
                        print("Please agree to the terms and conditions")
                        // Show an alert to the user
                        showAlert = true
                    }
                }
            )
            .padding(.top, 5)
            .alert("Terms Confirmation", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Please agree to our Terms of Service and Privacy Policy to continue")
            }
            
            // Already have an account
            HStack {
                Text("Already have an account?")
                    .foregroundColor(.gray)
                
                Button(action: {
                    authViewModel.navigateTo(.login)
                }) {
                    Text("Login")
                        .foregroundColor(.accent)
                        .bold()
                }
            }
            Spacer()
        }
    }
}

#Preview {
    SignupView()
        .environmentObject(AuthViewModel())
}
