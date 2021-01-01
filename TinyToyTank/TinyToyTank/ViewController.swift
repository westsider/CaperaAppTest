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
    
    @IBOutlet weak var tankLeftBttn: UIButton!
    
    @IBOutlet weak var tankRightBttn: UIButton!
    
    @IBOutlet weak var tankForewardBttn: UIButton!
    
    @IBOutlet weak var turretRightBttn: UIButton!
    
    @IBOutlet weak var turretLeft: UIButton!
    
    @IBOutlet weak var fireBttn: UIButton!
    
    var tankAnchor: TinyToyTank._TinyToyTank?
    
    var isActionPlaying: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tankAnchor = try! TinyToyTank.load_TinyToyTank()
        arView.scene.anchors.append(tankAnchor!)
        tankAnchor!.cannon?.setParent(
          tankAnchor!.tank, preservingWorldTransform: true)
        tankAnchor?.actions.actionComplete.onAction = { _ in
          self.isActionPlaying = false
        }

    }
    
    @IBAction func tankRightPressed(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.notifications.tankRight.post()
        dimButton(sender as! UIButton)
    }
    
    @IBAction func tankForwardPressed(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.notifications.tankForward.post()
        dimButton(sender as! UIButton)
    }
    
    @IBAction func tankLeftPressed(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true } 
        tankAnchor!.notifications.tankLeft.post()
        dimButton(sender as! UIButton)
    }
    
    @IBAction func turretRightPressed(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.notifications.turretRight.post()
        dimButton(sender as! UIButton)
    }
    
    @IBAction func cannonFirePressed(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.notifications.cannonFire.post()
        dimButton(sender as! UIButton)
    }
    
    @IBAction func turretLeftPressed(_ sender: Any) {
        if self.isActionPlaying { return }
        else { self.isActionPlaying = true }
        tankAnchor!.notifications.turretLeft.post()
        dimButton(sender as! UIButton)
    }
    
    func dimButton(_ sender: UIButton) {
        sender.alpha = 0.1
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            sender.alpha = 1.0
        }
    }
}
