//
//  PrimaryButton.swift
//  Livinit
//
//  Created by Shiwen on 3/7/25.
//

import SwiftUI

// Button corner style enum
enum ButtonCornerStyle {
    case rounded
    case square
    
    func radius() -> CGFloat {
        switch self {
        case .rounded:
            return 30
        case .square:
            return 8
        }
    }
}

// Custom button component
struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    var backgroundColor: Color = .accent
    var foregroundColor: Color = .white
    var cornerStyle: ButtonCornerStyle = .rounded
    var horizontalPadding: CGFloat = 30
    var fullWidth: Bool = true
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(foregroundColor)
                .bold()
                .frame(maxWidth: fullWidth ? .infinity : nil)
                .padding()
                .background(backgroundColor)
                .cornerRadius(cornerStyle.radius())
                .shadow(radius: 5)
        }
        .padding(.horizontal, horizontalPadding)
    }
}

#Preview {
    VStack(spacing: 20) {
        PrimaryButton(
            title: "Full Width Rounded",
            action: { print("Click Login") }
        )
        
        PrimaryButton(
            title: "Full Width Square",
            action: { print("Click Login") },
            cornerStyle: .square
        )
        
        PrimaryButton(
            title: "Rounded",
            action: { print("Click Login") },
            fullWidth: false
        )
        
        PrimaryButton(
            title: "Square",
            action: { print("Click Login") },
            cornerStyle: .square,
            fullWidth: false
        )
    }
    .padding()
} 
