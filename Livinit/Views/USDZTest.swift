//
//  USDZTest.swift
//  Livinit
//
//  Created by T-Bo Rabin on 3/14/25.
//

import UIKit
import SwiftUI
import SceneKit

class ViewController: UIViewController {

    var cameraNode: SCNNode!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a SCNView
        let sceneView = SCNView(frame: self.view.frame)
        self.view.addSubview(sceneView)

        // Create a new scene
        let scene = SCNScene()
        sceneView.scene = scene

        // Create and add a camera to the scene
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(0, 0, 10)
        scene.rootNode.addChildNode(cameraNode)
        sceneView.pointOfView = cameraNode

        // Log available resources
        let availableResources = Bundle.main.paths(forResourcesOfType: "usdz", inDirectory: nil)
        print("Available USDZ resources: \(availableResources)")

        // Check if the USDZ model file exists
        if let usdzScene = SCNScene(named: "minimalist_small_1.usdz") {
            // Add the USDZ model to the scene
            let node = SCNNode()
            for childNode in usdzScene.rootNode.childNodes {
                node.addChildNode(childNode)
            }
            scene.rootNode.addChildNode(node)
        } else {
            // Fallback: Add a gray sphere if the model fails to load
            let fallbackNode = SCNNode(geometry: SCNSphere(radius: 1.0))
            fallbackNode.position = SCNVector3(0, 0, -5)
            let grayMaterial = SCNMaterial()
            grayMaterial.diffuse.contents = UIColor.gray
            fallbackNode.geometry?.materials = [grayMaterial]
            scene.rootNode.addChildNode(fallbackNode)
        }

        // Configure the scene view
        sceneView.allowsCameraControl = false
        sceneView.autoenablesDefaultLighting = true

        // Add pan gesture recognizer to move the camera
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        sceneView.addGestureRecognizer(panGesture)
    }

    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: gesture.view)
        let xTranslation = Float(translation.x) * 0.01
        let yTranslation = Float(translation.y) * 0.01

        cameraNode.position.x -= xTranslation
        cameraNode.position.y += yTranslation

        gesture.setTranslation(CGPoint.zero, in: gesture.view)
    }
}

struct ViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        // No update needed
    }
}

#Preview {
    ViewControllerPreview()
}
