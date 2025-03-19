import Foundation
import SwiftUI

struct NewDesignView: View {
    @State private var selectedRoomStyle = "Standard"
    @State private var budget: Double = 500 // Default value

    let roomStyles = ["Standard", "Modern", "Classic"]
    let backgroundColor = Color(red: 0.97, green: 0.97, blue: 1)
    let selectedColor = Color(red: 122/255, green: 145/255, blue: 238/255)
    let fontStyle = "Poppins-Bold"
    
    var body: some View {
        VStack(spacing: 0) { // Keep title at the top
            // Fixed Header
            HStack {
                Text("New Design")
                    .font(.custom(fontStyle, size: 28))
                    .bold()
                Spacer()
                navItem(icon: "arrow.clockwise", label: "Start Over")
            }
            .padding()
            .background(Color.white) // Ensures it has a visible background
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5) // Optional shadow for separation
            .zIndex(1) // Ensures it stays above the scrollable content
            
            // Scrollable Content
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Room Preview
                    VStack {
                        ZStack(alignment: .bottomTrailing) {
                            LayoutView(usdzFileName: "RoomModel.usdz")
                                .frame(height: 400)
                                .cornerRadius(10)
                            
                            Text("10 x 15 ft")
                                .font(.custom(fontStyle, size: 14))
                                .bold()
                                .padding(5)
                                .background(Color.blue.opacity(0.8))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .padding(8)
                        }
                    }
                    .padding(.horizontal)

                    // Room Style Selection
                    Text("Select Room Style")
                        .font(.custom(fontStyle, size: 20))
                        .bold()
                        .padding(.horizontal)

                    HStack {
                        ForEach(roomStyles, id: \.self) { style in
                            VStack {
                                Rectangle() // Placeholder for room style image
                                    .fill(style == selectedRoomStyle ? selectedColor.opacity(0.4) : backgroundColor)
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(10)
                                
                                Text(style)
                                    .font(.custom(fontStyle, size: 14))
                            }
                            .padding()
                            .background(style == selectedRoomStyle ? selectedColor.opacity(0.6) : Color.clear)
                            .cornerRadius(12)
                            .onTapGesture {
                                selectedRoomStyle = style
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)

                    // Budget Slider
                    VStack {
                        Text("Budget: $\(Int(budget))")
                            .font(.custom(fontStyle, size: 16))
                            .bold()
                            .padding(.bottom, 4)

                        Slider(
                            value: $budget,
                            in: 0...1000,
                            step: 10
                        )
                        .accentColor(.blue)
                        .padding(.horizontal)
                    }
                    .padding()
                    .background(backgroundColor)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    // Prompts Section
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<4) { index in
                                Text("Prompt")
                                    .font(.custom(fontStyle, size: 14))
                                    .frame(minWidth: 80, maxWidth: 120)
                                    .frame(height: 40)
                                    .background(backgroundColor)
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Main Prompt Section
                    Text("Prompt xxxxxx")
                        .font(.custom(fontStyle, size: 14))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(backgroundColor)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    Spacer(minLength: 100) // Extra space to prevent cutting content
                }
            }

            // Bottom Navigation Bar
//            HStack {
//                Spacer()
//                navItem(icon: "house", label: "Home")
//                Spacer()
//                navItem(icon: "magnifyingglass", label: "Explore")
//                Spacer()
//                navItem(icon: "slider.horizontal.3", label: "Visualize", isSelected: true)
//                Spacer()
//                navItem(icon: "bookmark", label: "Saved")
//                Spacer()
//                navItem(icon: "person", label: "Profile")
//                Spacer()
//            }
//            .padding()
//            .background(Color.white)
        }
    }

    private func navItem(icon: String, label: String, isSelected: Bool = false) -> some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(isSelected ? .blue : .gray)
            Text(label)
                .font(.custom(fontStyle, size: 12))
                .foregroundColor(isSelected ? .blue : .gray)
        }
    }
}

struct NewDesignView_Previews: PreviewProvider {
    static var previews: some View {
        NewDesignView()
    }
}
