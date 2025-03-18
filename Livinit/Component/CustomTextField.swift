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
            
            ZStack(alignment: .leading) {
                if isSecure {
                    if isPasswordVisible {
                        TextField(placeholder, text: $text)
                    } else {
                        SecureField(placeholder, text: $text)
                    }
                } else {
                    TextField(placeholder, text: $text)
                }
            }
            .frame(height: 20) // Fix the height of the text field
            
            if isSecure {
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                        .foregroundColor(.gray)
                }
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
