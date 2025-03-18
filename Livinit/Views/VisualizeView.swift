// Sunniva Liu
import Foundation
import SwiftUI

struct VisualizeView: View {
    let selectedColor = Color(red: 122/255, green: 145/255, blue: 238/255)
    let backgroundColor = Color(red: 0.97, green: 0.97, blue: 1)
    let fontStyle = "Poppins-Bold"
    let Prompts = [
        "Design a budget-friendly living space for four individuals in a sleek, minimalistic aesthetic, keeping costs under $1,000.",
        "Incorporate a sectional sofa and a large coffee table in the bohemian-style living room for six people, Under $3500. Use good quality.",
        "Design a rustic-style living room tailored for three people. Use natural materials such as wood and stone, along with cozy textiles"
    ]
    @State private var promptText: String = "Write your own words"
    @State private var selectedPrompt = ""
    
    var body: some View {
        VStack(spacing: 0) { // Ensures title stays at the top
            // Fixed Header
            HStack {
                Text("Visualize")
                    .font(.custom(fontStyle, size: 28))
                    .bold()
                Spacer()
                HStack(spacing: 12) {
                    Image(systemName: "cart")
                    Image(systemName: "bell")
                    Image(systemName: "person.circle")
                    Image(systemName: "plus")
                        .frame(width: 30, height: 30)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                    Image(systemName: "camera.fill")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(selectedColor)
                        .clipShape(Circle())
                }
            }
            .padding()
            .background(Color.white) // Ensure title is readable
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5) // Optional shadow
            .zIndex(1) // Keep above scrollable content
            
            // Scrollable Content
            ScrollView {
                VStack(spacing: 16) {
                    // Room Preview
                    VStack {
                        ZStack(alignment: .bottomTrailing) {
                            LayoutView(usdzFileName: "RoomModel")
                                .frame(height: 400)
                                .cornerRadius(10)

                            // Circles aligned to bottom-right
                            HStack(spacing: -5) { // Slight overlap
                                ForEach(0..<3) { _ in
                                    Image(systemName: "chair")
                                        .foregroundColor(.white)
                                        .padding(8)
                                        .background(Color.gray)
                                        .clipShape(Circle())
                                }
                                ZStack {
                                    Circle()
                                        .fill(selectedColor)
                                        .frame(width: 40, height: 40)
                                    Text("+4")
                                        .font(.footnote)
                                        .bold()
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(.trailing, 10) // Push right
                            .padding(.bottom, 10)   // Push bottom
                        }
                        
                        // Recreate Button
                        HStack {
                            Button(action: {}) {
                                Image(systemName: "arrow.clockwise")
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(selectedColor)
                                    .clipShape(Rectangle())
                                    .cornerRadius(5)
                            }
                            .padding(.top, 8)
                            Spacer()
                        }
                    }
                    .padding(.horizontal)

                    // Prompt Selection
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(Prompts, id: \.self) { prompt in
                                Button(action: {
                                    selectedPrompt = prompt
                                }) {
                                    Text(prompt)
                                        .font(.custom(fontStyle, size: 14))
                                        .multilineTextAlignment(.center)
                                        .lineLimit(4)
                                        .frame(minWidth: 80, maxWidth: 120)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .padding(.horizontal, 12)
                                        .frame(height: 80)
                                        .background(selectedPrompt == prompt ? selectedColor : backgroundColor)
                                        .foregroundColor(selectedPrompt == prompt ? .white : .black)
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }

                    // Prompt Input + Create Button
                    HStack {
                        TextField("Enter prompt...", text: $promptText)
                            .font(.custom(fontStyle, size: 14))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)

                        Button(action: {}) {
                            Text("Create")
                                .font(.footnote)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                                .background(selectedColor)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)

                    Spacer(minLength: 100) // Prevents content from getting cut off
                }
            }

            // Bottom Navigation Bar
            HStack {
                Spacer()
                navItem(icon: "house", label: "Home")
                Spacer()
                navItem(icon: "magnifyingglass", label: "Explore")
                Spacer()
                navItem(icon: "slider.horizontal.3", label: "Visualize", isSelected: true)
                Spacer()
                navItem(icon: "bookmark", label: "Saved")
                Spacer()
                navItem(icon: "person", label: "Profile")
                Spacer()
            }
            .padding()
            .background(Color.white)
        }
    }

    private func navItem(icon: String, label: String, isSelected: Bool = false) -> some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(isSelected ? .blue : .gray)
            Text(label)
                .font(.caption)
                .foregroundColor(isSelected ? .blue : .gray)
        }
    }
}

struct VisualizeView_Previews: PreviewProvider {
    static var previews: some View {
        VisualizeView()
    }
}
