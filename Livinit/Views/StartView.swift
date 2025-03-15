//
//  StartView.swift
//  Livinit
//
//  Created by Lareina Yang on 3/15/25.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Spacer()
                
                // Images layout
                ZStack {
                    // Main center image with blue circle border
                    ZStack {
                        Circle()
                            .stroke(Color.accentColor, lineWidth: 8)
                            .frame(width: 280, height: 280)
                        
                        Image("bg-1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 250, height: 250)
                            .clipShape(Circle())
                    }
                    
                    // Top left small image
                    Image("bg-2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .position(x: 100, y: 100)
                    
                    // Top right small image
                    Image("bg-3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .position(x: 300, y: 100)
                    
                    // Bottom left small image
                    Image("bg-4")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .position(x: 100, y: 300)
                    
                    // Bottom right small image
                    Image("bg-5")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .position(x: 300, y: 300)
                }
                .frame(height: 400)
                
                Spacer()
                
                // Title
                Text("Visualize, customize, and bring your dream home.")
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.bottom, 20)
                
                // Get Started Button
                PrimaryButton(
                    title: "GET STARTED",
                    action: {
                        // Mark that user has seen the start screen
                        authViewModel.markStartScreenAsSeen()
                        // Navigate to login
                        authViewModel.navigateTo(.login)
                    }
                )
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    StartView()
        .environmentObject(AuthViewModel())
}
