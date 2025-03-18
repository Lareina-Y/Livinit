//Sunniva Liu

import SwiftUI
import SceneKit

struct LayoutView: UIViewRepresentable {
    let usdzFileName: String

    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        sceneView.allowsCameraControl = true  // Enable user interaction (zoom, pan, rotate)
        sceneView.autoenablesDefaultLighting = true
        sceneView.backgroundColor = UIColor.systemBackground

        // Load USDZ model
        if let scene = SCNScene(named: usdzFileName) {
            sceneView.scene = scene
        } else {
            print("⚠️ Error: Could not load \(usdzFileName)")
        }

        return sceneView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {
        // You can add dynamic updates here if needed
    }
}
