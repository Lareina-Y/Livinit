//
//  ContentView.swift
//  Livinit
//
//  Created by Lareina Yang on 2/27/25.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @State private var selectedRoom: RoomType = .standard

    var body: some View {
        VStack {
            // Room Selection Tabs
            HStack {
                RoomTab(title: "Standard", isSelected: selectedRoom == .standard) {
                    selectedRoom = .standard
                }
                RoomTab(title: "Modern", isSelected: selectedRoom == .modern) {
                    selectedRoom = .modern
                }
            }
            .padding(.horizontal)

            // Display Selected Room
            ZStack {
                if selectedRoom == .standard {
                    SplineWebView(urlString: RoomType.standard.url)
                } else {
                    SplineWebView(urlString: RoomType.modern.url)
                }
            }
            .frame(height: 350)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding()

            // Price & Redesign Button
//            HStack {
//                Text("$950")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(.blue)
//                    .padding(.leading)
//
//                Spacer()
//
//                Button(action: { print("Redesign tapped") }) {
//                    Text("Redesign")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                .padding(.trailing)
//            }
//            .padding()
        }
    }
}

// Enum to manage room types and URLs
enum RoomType {
    case standard, modern

    var url: String {
        switch self {
        case .standard:
            return "https://my.spline.design/untitled-3b52fddf0576737874ad0646f76da2d9/"
        case .modern:
            return "https://my.spline.design/livingroom2-afab216dbf3d850bacacb4aba4dedca3/"
        }
    }
}

// Room Tab Button
struct RoomTab: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(isSelected ? Color.blue.opacity(0.2) : Color.clear)
                .cornerRadius(10)
                .foregroundColor(isSelected ? .blue : .gray)
        }
    }
}

// WebView for embedding Spline 3D models
struct SplineWebView: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {}
}

// Preview
#Preview {
    ContentView()
}
