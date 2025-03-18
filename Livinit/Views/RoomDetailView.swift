//
//  StyleSelect.swift
//  Livinit
//
//  Created by Lareina Yang on 2/28/25.
//

import SwiftUI
import WebKit

struct RoomDetailView: View {
    let roomType: RoomType
    
    var body: some View {
        SplineWebView(urlString: roomType.url)
            .ignoresSafeArea(.all)
        }
}

#Preview {
    RoomDetailView(roomType: .livingRoom1)
}
