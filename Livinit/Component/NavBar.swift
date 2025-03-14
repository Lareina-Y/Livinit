////
////  NavBar.swift
////  Livinit
////
////  Created by T-Bo Rabin on 3/10/25.
////
//
//import SwiftUI
//
//// MARK: - Tab Enum
//enum TabItem: CaseIterable {
//    case home, explore, create, saved, profile
//    
//    var icon: String {
//        switch self {
//        case .home: return "house"
//        case .explore: return "safari"
//        case .create: return "plus"
//        case .saved: return "bookmark"
//        case .profile: return "person"
//        }
//    }
//    
//    var label: String {
//        switch self {
//        case .home: return "Home"
//        case .explore: return "Explore"
//        case .create: return "Create"
//        case .saved: return "Saved"
//        case .profile: return "Profile"
//        }
//    }
//    
//    var color: Color {
//        switch self {
//        case .home: return .accent
//        case .explore: return .accent
//        case .create: return .accent
//        case .saved: return .accent
//        case .profile: return .accent
////        default: return .gray
//        }
//    }
//}
//
//
//
//struct ContentView: View {
//    @State private var selectedTab: TabItem = .home
//    
//    var body: some View {
//        NavigationView{
//            VStack(spacing: 0) {
//                if selectedTab == .home {
//                    HomeView()
//                }
//                else if selectedTab == .explore {
//                    ExploreView()
//                }
//                else if selectedTab == .create {
//                    VisualizeView()
//                }
//                else if selectedTab == .saved {
//                    SignupView()
//                }
//                else if selectedTab == .profile {
//                    ProfileView()
//                }
//                
//                NavigationBarView(selectedTab: $selectedTab)
//            }
//            .navigationBarHidden(true)
//        }
//    }
//}
//
//
//// MARK: - Navigation Bar View
//struct NavigationBarView: View {
////    var selectedTab: TabItem
//    @Binding var selectedTab: TabItem
//    
//    var body: some View {
//        HStack {
//            ForEach(TabItem.allCases, id: \.self) {
//                tab in Button(action: {
//                    selectedTab = tab
//                }) {
//                    NavigationBarItemView(tab: tab, isSelected: selectedTab == tab)
//                }
//                .frame(maxWidth: .infinity)
//            }
//        }
//        .padding(.top, 12)
//        .padding(.bottom, 30) // Extra padding for home indicator
//        .background(Color.white)
//        .clipShape(
//            RoundedCornersShape(corners: [.topLeft, .topRight], radius: 0)
//        )
////        .overlay(
////            // Home indicator
////            Rectangle()
////                .frame(width: 120, height: 5)
////                .cornerRadius(2.5)
////                .foregroundColor(.black.opacity(0.2))
////                .padding(.bottom, 10),
////            alignment: .bottom
////        )
//        .shadow(color: Color.black.opacity(0.05), radius: 2, y: -2)
//    }
//}
//
//// MARK: - Navigation Bar Item View
//struct NavigationBarItemView: View {
//    let tab: TabItem
//    let isSelected: Bool
//    
//    private var color: Color {
//        if tab == .create {
//            return tab.color
//        }
//        return isSelected ? .accent : .gray
//    }
//    
//    var body: some View {
//        VStack(spacing: 4) {
//            if tab == .create {
//                // Special styling for create button
//                ZStack {
//                    Circle()
//                        .fill(.accent)
//                        .frame(width: 40, height: 40)
//                    
//                    Image(systemName: tab.icon)
//                        .foregroundColor(.white)
//                        .font(.system(size: 20))
//                }
//                .offset(y: -5)
//            } else {
//                Image(systemName: tab.icon)
//                    .foregroundColor(color)
//                    .font(.system(size: 20))
//            }
//            
//            if tab != .create {
//                Text(tab.label)
//                    .font(.caption2)
//                    .foregroundColor(color)
//            }
//        }
//        .frame(height: 50)
//    }
//}
//
//// MARK: - Rounded Corners Shape
//struct RoundedCornersShape: Shape {
//    var corners: UIRectCorner
//    var radius: CGFloat
//    
//    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath(
//            roundedRect: rect,
//            byRoundingCorners: corners,
//            cornerRadii: CGSize(width: radius, height: radius)
//        )
//        return Path(path.cgPath)
//    }
//}
//
//// MARK: - Preview
////struct NavigationBarView_Previews: PreviewProvider {
////    static var previews: some View {
////        VStack {
////            Spacer()
////            NavigationBarView(selectedTab: .home)
////        }
////        .background(Color(UIColor.systemGray6))
////        .edgesIgnoringSafeArea(.bottom)
////    }
////}
