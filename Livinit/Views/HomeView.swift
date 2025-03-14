//
//  HomePage.swift
//  Livinit
//
//  Created by Lareina Yang on 3/6/25.
//

import SwiftUI
import ARKit
import RealityKit

struct HomeView: View {
//    @State private var selectedTab: TabItem = .home
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(UIColor.systemGray6)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Header
                    HeaderView(username: "Profile name")
                    
                    
                    VStack(spacing: 24) {
                        // Trending Designs Section
                        SectionHeaderView(title: "Trending Designs")
                        
                        // Design Cards
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                DesignCardView(
                                    roomImage: "living.room",
                                    roomType: "Living Room",
                                    designName: "Modern Living Room",
                                    description: "living room for 6",
                                    price: "$1200.00",
                                    rating: 5.0,
                                    action: { print("living room 1 card tapped")},
                                    imageName: "bg-2"
                                )
                                
                                DesignCardView(
                                    roomImage: "bed.room",
                                    roomType: "Bed Room",
                                    designName: "Classic Bedroom",
                                    description: "master bedroom",
                                    price: "$1500.00",
                                    rating: 4.8,
                                    action: { print("bed room card tapped")},
                                    imageName: "bg-3"
                                )
                                
                                DesignCardView(
                                    roomImage: "living.room",
                                    roomType: "Dining Room",
                                    designName: "Modern Dining Room",
                                    description: "dining room for 8",
                                    price: "$1500.00",
                                    rating: 4.7,
                                    action: {print("living room 2 card tapped")},
                                    imageName: "bg-4"
                                )
                                
                            }
                            .padding(.horizontal)
                        }
                        
                        
                        // Banner
                        DesignBannerView()
                    }
                    .padding(.top, 16)
                    
                    Spacer()
                }
            }
        }
    }
}

// MARK: - Header View
struct HeaderView: View {
    let username: String
    
    var body: some View {
        ZStack {
            Color.accent.opacity(1.0)
                .ignoresSafeArea(.all, edges: .top)
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 4) {
                        Image("livinit-logo-small")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
//                            .frame(width: 100, height: 100)
                        
                        Text("LIVINIT")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    
                    Text(username)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .frame(height: 100)
        .cornerRadius(20)
//        .padding()
    }
}

// MARK: - Section Header View
struct SectionHeaderView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
            
            Spacer()
            
            
            Button(action: {}) {
                Text("See More")
                    .font(.subheadline)
                    .foregroundColor(.accent.opacity(0.7))
            }
        }
        .padding(.horizontal)
    }
}

// MARK: - Design Card View
struct DesignCardView: View {
    let roomImage: String
    let roomType: String
    let designName: String
    let description: String
    let price: String
    let rating: Double
    let action: () -> Void
    let imageName: String
    @State private var isHeartFilled: Bool = false
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .topTrailing) {
                    // Room image
//                    RoomImageView(imageName: roomImage)
//                        .frame(height: 180)
//                        .clipped()
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 200)
                    
                    //
                    // Heart button
                    HeartButton(isFilled: $isHeartFilled) }
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(designName)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
            
                        HStack(spacing: 2) {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.system(size: 12))
                            
                            Text(String(format: "%.1f", rating))
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                        }
                    }
                    
                    
                    Text(description)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                    
                    Text(price)
                        .font(.headline)
                        .foregroundColor(.accent)
                        .padding(.top, 4)
                }
                .padding(30)
            }
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 3)
        }
        }
        
}

// MARK: - Room Image View
struct RoomImageView: View {
    let imageName: String
    
    var body: some View {
        // In a real app, this would load an image from assets or a URL
        // For this demo, we'll create a placeholder
        ZStack {
            Color.gray.opacity(0.1)
            
            if imageName == "living.room" {
                // Living room placeholder
                ZStack {
                    // Floor
                    Rectangle()
                        .fill(Color(UIColor.systemBrown).opacity(0.7))
                        .frame(width: 160, height: 80)
                        .offset(y: 40)
                    
                    // Walls
                    ZStack {
                        // Back wall
                        Rectangle()
                            .fill(Color.accent.opacity(0.2))
                            .frame(width: 160, height: 120)
                            .offset(y: -20)
                        
                        // Side wall
                        Rectangle()
                            .fill(Color.accent.opacity(0.3))
                            .frame(width: 80, height: 120)
                            .offset(x: -40, y: -20)
                    }
                    
                    // Basic furniture
                    HStack(spacing: 40) {
                        Rectangle()
                            .fill(Color.gray.opacity(0.7))
                            .frame(width: 40, height: 30)
                            .offset(y: 25)
                        
                        Rectangle()
                            .fill(Color.gray.opacity(0.7))
                            .frame(width: 40, height: 30)
                            .offset(y: 25)
                    }
                }
            } else {
                // Bedroom placeholder
                ZStack {
                    // Floor
                    Rectangle()
                        .fill(Color(UIColor.systemBrown).opacity(0.7))
                        .frame(width: 160, height: 80)
                        .offset(y: 40)
                    
                    // Walls
                    ZStack {
                        // Back wall
                        Rectangle()
                            .fill(Color.yellow.opacity(0.2))
                            .frame(width: 160, height: 120)
                            .offset(y: -20)
                    }
                    
                    // Bed
                    Rectangle()
                        .fill(Color.yellow.opacity(0.7))
                        .frame(width: 80, height: 50)
                        .offset(y: 25)
                }
            }
        }
        .cornerRadius(16)
    }
}

// MARK: - Design Banner View
struct DesignBannerView: View {
    @State private var navigateToVisualize: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Banner Image
            Image("bg-3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.black.opacity(1.0), Color.black.opacity(0.0)]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(20)
                .padding(.horizontal)
            
            VStack(spacing: 16) {
                Text("Budget, Size,")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                NavigationLink(destination: VisualizeView()) {
                    PrimaryButton(
                        title: "Design My Room",
                        action: {navigateToVisualize = true},
                        cornerStyle: .square,
                        fullWidth: false
                    )
                }
            }
            .padding(24)
            
            // link design my room button to visualizeView
            .navigationDestination(isPresented: $navigateToVisualize) {
                VisualizeView()
            }
            
        }
    }
}

// MARK: - Profile Avatar View
struct ProfileAvatarView: View {
    let initial: String
    let color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
            
            Text(initial)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
        }
        .frame(width: 40, height: 40)
    }
}

// MARK: - Preview

#Preview {
    HomeView()
}
