//
//  StartView.swift
//  Livinit
//
//  Created by Lareina Yang on 3/15/25.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    // Animation state variables
    @State private var mainImageScale: CGFloat = 1.0
    @State private var topLeftPosition: CGPoint = CGPoint(x: 55, y: 50)
    @State private var topRightPosition: CGPoint = CGPoint(x: 350, y: 60)
    @State private var bottomLeftPosition: CGPoint = CGPoint(x: 60, y: 350)
    @State private var bottomRightPosition: CGPoint = CGPoint(x: 335, y: 370)
    
    // Movement distance
    private let moveDistance: CGFloat = 10
    
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
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                        
                        Image("bg-1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 250, height: 250)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.15), radius: 8, x: 0, y: 4)
                            .scaleEffect(mainImageScale)
                            .animation(
                                Animation.easeInOut(duration: 3.0)
                                    .repeatForever(autoreverses: true),
                                value: mainImageScale
                            )
                    }
                    .onAppear {
                        mainImageScale = 1.05
                    }
                    
                    // Top left small image
                    Image("bg-2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.2), radius: 6, x: 2, y: 2)
                        .position(topLeftPosition)
                        .animation(
                            Animation.easeInOut(duration: 2.0)
                                .repeatForever(autoreverses: true),
                            value: topLeftPosition
                        )
                        .onAppear {
                            // Move towards center
                            topLeftPosition = CGPoint(
                                x: topLeftPosition.x + moveDistance,
                                y: topLeftPosition.y + moveDistance
                            )
                        }
                    
                    // Top right small image
                    Image("bg-3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: -2, y: 2)
                        .position(topRightPosition)
                        .animation(
                            Animation.easeInOut(duration: 2.5)
                                .repeatForever(autoreverses: true),
                            value: topRightPosition
                        )
                        .onAppear {
                            // Move towards center
                            topRightPosition = CGPoint(
                                x: topRightPosition.x - moveDistance,
                                y: topRightPosition.y + moveDistance
                            )
                        }
                    
                    // Bottom left small image
                    Image("bg-4")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 2, y: -2)
                        .position(bottomLeftPosition)
                        .animation(
                            Animation.easeInOut(duration: 3.0)
                                .repeatForever(autoreverses: true),
                            value: bottomLeftPosition
                        )
                        .onAppear {
                            // Move towards center
                            bottomLeftPosition = CGPoint(
                                x: bottomLeftPosition.x + moveDistance,
                                y: bottomLeftPosition.y - moveDistance
                            )
                        }
                    
                    // Bottom right small image
                    Image("bg-5")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 95, height: 95)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.2), radius: 7, x: -2, y: -2)
                        .position(bottomRightPosition)
                        .animation(
                            Animation.easeInOut(duration: 3.5)
                                .repeatForever(autoreverses: true),
                            value: bottomRightPosition
                        )
                        .onAppear {
                            // Move towards center
                            bottomRightPosition = CGPoint(
                                x: bottomRightPosition.x - moveDistance,
                                y: bottomRightPosition.y - moveDistance
                            )
                        }
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
