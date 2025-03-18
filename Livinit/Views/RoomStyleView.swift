//
//  RoomStyle.swift
//  Livinit
//
//  Created by Lareina Yang on 3/6/25.
//

import SwiftUI

struct RoomStyleView: View {
    @State private var selectedRoom: RoomType = .livingRoom1

    var body: some View {
        VStack {
            // Room Selection Tabs
            HStack {
                RoomTab(title: "livingRoom1", isSelected: selectedRoom == .livingRoom1) {
                    selectedRoom = .livingRoom1
                }
                RoomTab(title: "livingRoom2", isSelected: selectedRoom == .livingRoom2) {
                    selectedRoom = .livingRoom2
                }
            }
            .padding(.horizontal)

            // Display Selected Room
            ZStack {
                if selectedRoom == .livingRoom1 {
                    SplineWebView(urlString: RoomType.livingRoom1.url)
                } else {
                    SplineWebView(urlString: RoomType.livingRoom2.url)
                }
            }
            .frame(height: 350)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding()
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

#Preview {
    RoomStyleView()
}
