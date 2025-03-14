//
//  ExplorePage.swift
//  Livinit
//
//  Created by Lareina Yang on 3/6/25.
//

import SwiftUI

struct ExploreView: View {
    // MARK: - Properties
    @State private var selectedInspirationIndex = 0
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    // Header with profile icon
                    ExploreHeaderView(title: "Explore")
                    
                    // Ideas For You section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Ideas For You")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        // Inspiration categories with paging dots
                        VStack(spacing: 8) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 12) {
                                    InspirationCard(type: .standard, imageName: "standard_room")
                                    InspirationCard(type: .modern, imageName: "modern_room")
                                    InspirationCard(type: .classic, imageName: "classic_room")
                                    InspirationCard(type: .classic, imageName: "classic_room")
                                }
                                .padding(.horizontal, 4)
                            }
                            
                            // Pagination dots
                            HStack(spacing: 4) {
                                ForEach(0..<3) { index in
                                    Circle()
                                        .fill(selectedInspirationIndex == index ? .accent : Color.gray.opacity(0.3))
                                        .frame(width: 8, height: 8)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    // Product Category section
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Product Category")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                        
                        // Category grid
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ], spacing: 16) {
                            CategoryItem(icon: "chair", label: "Chair")
                            CategoryItem(icon: "table", label: "Table")
                            CategoryItem(icon: "lamp", label: "Lamp")
                            CategoryItem(icon: "sofa", label: "Sofa")
                        }
                        .padding(.horizontal)
                    }
                    
                    // AR Design Preview section
                    VStack(spacing: 12) {
                        ARDesignPreviewCard()
                        
                        // Small design previews
                        HStack(spacing: 12) {
                            SmallDesignPreviewCard(imageName: "room_preview1")
                            SmallDesignPreviewCard(imageName: "room_preview2")
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.bottom, 80) // Space for tab bar
            }
            .navigationBarHidden(true)
            .background(Color(UIColor.systemGray6))
        }
    }
}

// MARK: - Supporting Views

struct ExploreHeaderView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            HStack(spacing: 16) {
                
                Button(action: {}) {
                    Image(systemName: "plus")
                        .font(.system(size: 22))
                        .foregroundColor(.primary)
                }
                
                Button(action: {}) {
                    Image(systemName: "camera")
                        .font(.system(size: 22))
                        .foregroundColor(.primary)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct InspirationCard: View {
    enum InspirationType: String {
        case standard = "Standard"
        case modern = "Modern"
        case classic = "Classic"
    }
    
    let type: InspirationType
    let imageName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Image would come from assets in a real app
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .aspectRatio(1, contentMode: .fit)
                .cornerRadius(12)
                .overlay(
                    Text(imageName)
                        .font(.caption)
                        .foregroundColor(.gray)
                )
            
            Text(type.rawValue)
                .font(.subheadline)
                .fontWeight(.medium)
        }
        .frame(width: 100)
    }
}

struct CategoryItem: View {
    let icon: String
    let label: String
    
    var body: some View {
        VStack(spacing: 8) {
            Circle()
                .fill(Color.white)
                .frame(width: 60, height: 60)
                .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
                .overlay(
                    Image(systemName: icon)
                        .font(.system(size: 22))
                        .foregroundColor(.gray)
                )
            
            Text(label)
                .font(.caption)
                .fontWeight(.medium)
        }
    }
}

struct ARDesignPreviewCard: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            // Main image
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .aspectRatio(16/9, contentMode: .fit)
                .cornerRadius(16)
                .overlay(
                    Text("Insert Icon")
                        .font(.caption)
                        .foregroundColor(.gray)
                )
                .padding(.horizontal)
        }
    }
}

struct SmallDesignPreviewCard: View {
    let imageName: String
    
    var body: some View {
        Rectangle()
            .fill(Color.gray.opacity(0.2))
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(12)
            .overlay(
                Text(imageName)
                    .font(.caption)
                    .foregroundColor(.gray)
            )
    }
}

// Preview
#Preview {
    ExploreView()
}
