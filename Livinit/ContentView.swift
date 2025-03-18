//
//  ContentView.swift
//  Livinit
//
//  Created by Lareina Yang on 2/27/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Int = 0
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
                .tag(1)
            
            VisualizeView()
                .tabItem {
                    Image(systemName: "plus")
                    Text("Create")
                }
                .tag(2)
            
            SavedView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Liked")
                }
                .tag(3)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(4)
        }
        .accentColor(.accent) // Highlight color
    }
}

// Preview
#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
