//
//  ViewController.swift
//  TinyToyTank
//
//  Created by Warren Hansen on 12/28/20.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    var tankAnchor: TinyToyTank._TinyToyTank?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tankAnchor = try! TinyToyTank.load_TinyToyTank()
        arView.scene.anchors.append(tankAnchor!)
    }
    
    @IBAction func tankRightPressed(_ sender: Any) {
        print("right bttn clicked")
    }
    
}
