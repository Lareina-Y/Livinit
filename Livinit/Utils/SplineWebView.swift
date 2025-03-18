//
//  SplineWebView.swift
//  Livinit
//
//  Created by Lareina Yang on 3/7/25.
//

import SwiftUI
import WebKit

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

#Preview {
    SplineWebView(urlString: RoomType.livingRoom2.url)
}
