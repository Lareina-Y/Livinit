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
            VStack(spacing: 24) {
                // Header with profile icon
                ExploreHeaderView(title: "Explore")
                
                // Ideas For You section
                VStack(alignment: .leading, spacing: 16) {
                    Text("Ideas For You")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    // Inspiration categories with paging dots
                    VStack(spacing: 4) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                InspirationCard(name: "minimalist small 1", imageName: "minimalist_small_1")
                                InspirationCard(name: "minimalist small 2", imageName: "minimalist_small_2")
                                InspirationCard(name: "minimalist small 3", imageName: "minimalist_small_3")
                                InspirationCard(name: "minimalist small 5", imageName: "minimalist_small_5")
                                InspirationCard(name: "minimalist small 7", imageName: "minimalist_small_7")
                            }
//                            .padding(.horizontal, 4)
                        }
                        
                        // Pagination dots
                        HStack(spacing: 4) {
                            ForEach(0..<3) { index in
                                Circle()
                                    .fill(selectedInspirationIndex == index ? .accentColor : Color.gray.opacity(0.3))
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
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            CategoryItem(name: "Chair", imageName: "chair", backgroundColor: Color.yellow)
                            CategoryItem(name: "Table", imageName: "table", backgroundColor: Color.blue)
                            CategoryItem(name: "Lamp", imageName: "lamp", backgroundColor: Color.orange)
                            CategoryItem(name: "Sofa", imageName: "sofa", backgroundColor: Color.green)
                        }
                        .padding(.horizontal, 4)
                    }
                }
                
                // AR Design Preview section
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 45) {
                        // Top card taking the entire width
                        DesignPreviewCard(imageName: "bg-1", aspectRatio: 16/9, cornerRadius: 16, padding: 0)
                            .frame(maxWidth: .infinity)
                        
                        // First row with one card
                        HStack {
                            DesignPreviewCard(imageName: "bg-2", aspectRatio: 1, cornerRadius: 12, padding: 0)
                                .frame(width: UIScreen.main.bounds.width / 2 - 16, height: 150)
                            DesignPreviewCard(imageName: "bg-3", aspectRatio: 1, cornerRadius: 12, padding: 0)
                                .frame(width: UIScreen.main.bounds.width / 2 - 16, height: 150)
                        }
                        
                        // Subsequent rows with two cards per row
                        HStack(spacing: 12) {
                            DesignPreviewCard(imageName: "bg-4", aspectRatio: 1, cornerRadius: 12, padding: 0)
                                .frame(width: UIScreen.main.bounds.width / 2 - 16, height: 150)
                            DesignPreviewCard(imageName: "bg-5", aspectRatio: 1, cornerRadius: 12, padding: 0)
                                .frame(width: UIScreen.main.bounds.width / 2 - 16, height: 150)
                        }
                        HStack(spacing: 12) {
                            DesignPreviewCard(imageName: "bg-1", aspectRatio: 1, cornerRadius: 12, padding: 0)
                                .frame(width: UIScreen.main.bounds.width / 2 - 16, height: 150)
                            DesignPreviewCard(imageName: "bg-2", aspectRatio: 1, cornerRadius: 12, padding: 0)
                                .frame(width: UIScreen.main.bounds.width / 2 - 16, height: 150)
                        }
                        // Add more rows as needed
                    }
                    .padding(.horizontal)
                }
                }
                Spacer()
            }
            .navigationBarHidden(true)
            .background(Color(UIColor.systemGray6))
    
    }
}

// MARK: - Supporting Views

struct ExploreHeaderView: View {
    let title: String
    @State private var isVisualizeViewActive: Bool = false
    
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            HStack(spacing: 16) {
                NavigationLink(destination: VisualizeView()) {
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
    let name: String
    let imageName: String
    
    var body: some View {
        VStack(spacing: 8) {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .cornerRadius(12)

                    Text(name)
                        .font(.footnote)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                )
                .frame(width: 200, height: 200)
        }
}

struct CategoryItem: View {
    let name: String
    let imageName: String
    let backgroundColor: Color

    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .fill(backgroundColor.opacity(0.2))
                    .frame(width: 80, height: 80)
                
                Image(imageName)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .cornerRadius(12)
            }

            Text(name)
                .font(.footnote)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
        .frame(width: 100, height: 120)
    }
}

struct DesignPreviewCard: View {
    let imageName: String?
    let aspectRatio: CGFloat
    let cornerRadius: CGFloat
    let padding: CGFloat
    @State private var isHeartFilled: Bool = false

    var body: some View {
            ZStack(alignment: .topTrailing) {
                if let imageName = imageName {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(aspectRatio, contentMode: .fill)
                        .cornerRadius(cornerRadius)
                        .padding(padding)
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .aspectRatio(aspectRatio, contentMode: .fill)
                        .cornerRadius(cornerRadius)
                        .padding(padding)
                }

                HeartButton(isFilled: $isHeartFilled)
                    .padding([.top, .trailing], 8)
            }
        }
}
// Preview
#Preview {
    ExploreView()
}
