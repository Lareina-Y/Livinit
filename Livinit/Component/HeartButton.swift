//
//  HeartButton.swift
//  Livinit
//
//  Created by T-Bo Rabin on 3/11/25.
//

import SwiftUI

struct HeartButton: View {
    @Binding var isFilled: Bool

    var body: some View {
        Button(action: {
            isFilled.toggle()
        }) {
            Image(systemName: "heart.fill")
                .foregroundColor(isFilled ? .accentColor : .white)
                .overlay(
                    Image(systemName: "heart")
                        .foregroundColor(.white)
                        .opacity(isFilled ? 0 : 1)
                )
                .padding(6)
        }
        .padding(8)
    }
}

#Preview {
    HeartButton(isFilled: .constant(false))
}
