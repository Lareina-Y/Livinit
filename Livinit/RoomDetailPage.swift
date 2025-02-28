//
//  StyleSelect.swift
//  Livinit
//
//  Created by Lareina Yang on 2/28/25.
//

import SwiftUI
import WebKit

struct RoomDetailPage: View {
    let roomType: RoomType
    
    var body: some View {
        SplineWebView(urlString: roomType.url)
            .ignoresSafeArea(.all)
        }
}

#Preview {
    RoomDetailPage(roomType: .standard) // .standard or .modern
}
