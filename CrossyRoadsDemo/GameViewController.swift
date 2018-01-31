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
	
	override func viewDidLoad() {
        super.viewDidLoad()
	   setupView()
        
	}
	
	func setupView() {
		sceneView = view as! SCNView
		setupScene()
	}
	
	func setupScene() {
		scene = SCNScene()
		sceneView.scene = scene
	}
}
