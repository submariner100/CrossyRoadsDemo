//
//  GameViewController.swift
//  CrossyRoadsDemo
//
//  Created by Macbook on 30/01/2018.
//  Copyright © 2018 Lodge Farm Apps. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

	var sceneView: SCNView!
	var scene: SCNScene!
	var cameraNode: SCNNode!
	
	override func viewDidLoad() {
        super.viewDidLoad()
	   setupView()
        
	}
	
	func setupView() {
		sceneView = view as! SCNView
		sceneView.showsStatistics = true
		sceneView.allowsCameraControl = true
		sceneView.autoenablesDefaultLighting = true
		
		
		setupScene()
	}
	
	func setupScene() {
		scene = SCNScene()
		sceneView.scene = scene
		setupCamera()
	}
	
	func setupCamera() {
		cameraNode = SCNNode()
		cameraNode.camera = SCNCamera()
		cameraNode.position = SCNVector3(x: 0, y: 0, z: 5)
		scene.rootNode.addChildNode(cameraNode)
		addSquare()
		//addSphere()
	}
	
	func addSquare() {
		let geometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
		let squareNode = SCNNode(geometry: geometry)
		squareNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
		scene.rootNode.addChildNode(squareNode)
		
		let force = SCNVector3(x: 0, y: 10.0, z: 0)
		let position = SCNVector3(x: 0.05, y: 0.05, z: 0.05)
		//squareNode.physicsBody?.applyForce(force, asImpulse: true)
		squareNode.physicsBody?.applyForce(force, at: position, asImpulse: true)
		
		let torqueForce = SCNVector4(x: 0, y: 0, z: 1, w: 1)
		squareNode.physicsBody?.applyTorque(torqueForce, asImpulse: true)
		
		
	}
	
	func addSphere() {
		let geometry = SCNSphere(radius: 1.0)
		let sphereNode = SCNNode(geometry: geometry)
		sphereNode.position = SCNVector3(x: 0, y: 1.5, z: 0)
		scene.rootNode.addChildNode(sphereNode)
		
	}
	
}
