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
                                    designName: "Modern Living Room 1",
                                    description: "living room for 6",
                                    price: "$1200.00",
                                    rating: 5.0,
                                    action: { print("living room 1 card tapped")},
                                    imageName: "minimalist_small_1"
                                )
                                
                                DesignCardView(
                                    designName: "Modern Living Room 2",
                                    description: "living room ",
                                    price: "$1500.00",
                                    rating: 4.8,
                                    action: { print("living room 2 card tapped")},
                                    imageName: "minimalist_small_2"
                                )
                                
                                DesignCardView(
                                    designName: "Modern Living Room 3",
                                    description: "living room for 8",
                                    price: "$1500.00",
                                    rating: 4.7,
                                    action: {print("living room 3 card tapped")},
                                    imageName: "minimalist_small_3"
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
//    let roomType: String
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
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)

                    // Heart button
                    HeartButton(isFilled: $isHeartFilled)
                        .padding([.top, .trailing], 8)
                }
                
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
                
                NavigationLink(destination: NewDesignView()) {
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
                NewDesignView()
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
