//
//  SplashView.swift
//  Livinit
//
//  Created by Lareina Yang on 3/7/25.
//

import SwiftUI

struct SplashView: View {
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            VStack {
                Image("livinit-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                    .scaleEffect(isAnimating ? 1.0 : 0.8)
                    .opacity(isAnimating ? 1.0 : 0.5)
                    .padding(.bottom, 70)
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.2)) {
                isAnimating = true
            }
        }
    }
}

#Preview {
    SplashView()
}
