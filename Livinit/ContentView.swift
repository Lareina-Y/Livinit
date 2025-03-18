//
//  ContentView.swift
//  Livinit
//
//  Created by Lareina Yang on 2/27/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }

            VisualizeView()
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                    Text("Visualize")
                }

            SavedView()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Saved")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        .accentColor(.accent) // Highlight color
    }
}

// Preview
#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
