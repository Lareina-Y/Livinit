//
//  CustomTextField.swift
//  Livinit
//
//  Created by Lareina Yang on 3/6/25.
//

import SwiftUI

// Custom TextField Component
struct CustomTextField: View {
    let icon: String
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
            
            if isSecure {
                if isPasswordVisible {
                    TextField(placeholder, text: $text)
                } else {
                    SecureField(placeholder, text: $text)
                }
                
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                        .foregroundColor(.gray)
                }
            } else {
                TextField(placeholder, text: $text)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(25)
        .padding(.horizontal, 30)
    }
}

#Preview {
    CustomTextField(icon: "lock", placeholder: "Password", text: .constant("123456"), isSecure: true)
}
