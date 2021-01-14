//
//  ViewController.swift
//  TestTarget
//
//  Created by Warren Hansen on 1/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var zeroBttn: UIButton!
    @IBOutlet weak var oneBttn: UIButton!
    @IBOutlet weak var twoBttn: UIButton!
    @IBOutlet weak var threeBttn: UIButton!
    @IBOutlet weak var fourBttn: UIButton!
    @IBOutlet weak var fiveBttn: UIButton!
    @IBOutlet weak var sixBttn: UIButton!
    @IBOutlet weak var sevenBttn: UIButton!
    
    var zero:Bool = false
    var one:Bool = false
    var two:Bool = false
    var three:Bool = false
    var four:Bool = false
    var five:Bool = false
    var six:Bool = false
    var seven: Bool = false
    var myDefaults = MyDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonState()
    }
    
    func setButtonState() {
        print("0 was \(zero)")
        zero = myDefaults.getButton(forValue: 0)
        if zero { zeroBttn.alpha = 0.3 } else {  zeroBttn.alpha = 1.0 }
        print("0 is \(zero)")
        one  = myDefaults.getButton(forValue: 1)
        if one { oneBttn.alpha = 0.3 } else {  oneBttn.alpha = 1.0 }
        two = myDefaults.getButton(forValue: 2)
        if two { twoBttn.alpha = 0.3 } else {  twoBttn.alpha = 1.0 }
        three = myDefaults.getButton(forValue: 3)
        if three { threeBttn.alpha = 0.3 } else {  threeBttn.alpha = 1.0 }
        four = myDefaults.getButton(forValue: 4)
        if four { fourBttn.alpha = 0.3 } else {  fourBttn.alpha = 1.0 }
        five = myDefaults.getButton(forValue: 5)
        if five { fiveBttn.alpha = 0.3 } else {  fiveBttn.alpha = 1.0 }
        six = myDefaults.getButton(forValue: 6)
        if six { sixBttn.alpha = 0.3 } else {  sixBttn.alpha = 1.0 }
        seven = myDefaults.getButton(forValue: 7)
        if seven { sevenBttn.alpha = 0.3 } else {  sevenBttn.alpha = 1.0 }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            print("Button Pressed \(sender.tag)")
            print("0 was \(zero)")
            zero.toggle()
            print("0 is now \(zero)")
            myDefaults.setButton(forValue: sender.tag, isOn: zero)
            print("0 was set to \(myDefaults.getButton(forValue: 0))")
            if zero { zeroBttn.alpha = 0.3 } else {  zeroBttn.alpha = 1.0 }
        case 1:
            print("Button Pressed \(sender.tag)")
            one.toggle()
            myDefaults.setButton(forValue: sender.tag, isOn: one)
            if one { oneBttn.alpha = 0.3 } else {  oneBttn.alpha = 1.0 }
        case 2:
            print("Button Pressed \(sender.tag)")
            two.toggle()
            myDefaults.setButton(forValue: sender.tag, isOn: two)
            if two { twoBttn.alpha = 0.3 } else {  twoBttn.alpha = 1.0 }
        case 3:
            print("Button Pressed \(sender.tag)")
            three.toggle()
            myDefaults.setButton(forValue: sender.tag, isOn: three)
            if three { threeBttn.alpha = 0.3 } else {  threeBttn.alpha = 1.0 }
        case 4:
            print("Button Pressed \(sender.tag)")
            four.toggle()
            myDefaults.setButton(forValue: sender.tag, isOn: four)
            if four { fourBttn.alpha = 0.3 } else {  fourBttn.alpha = 1.0 }
        case 5:
            print("Button Pressed \(sender.tag)")
            five.toggle()
            myDefaults.setButton(forValue: sender.tag, isOn: five)
            if five { fiveBttn.alpha = 0.3 } else {  fiveBttn.alpha = 1.0 }
        case 6:
            print("Button Pressed \(sender.tag)")
            six.toggle()
            myDefaults.setButton(forValue: sender.tag, isOn: six)
            if six { sixBttn.alpha = 0.3 } else {  sixBttn.alpha = 1.0 }
        case 7:
            print("Button Pressed \(sender.tag)")
            seven.toggle()
            myDefaults.setButton(forValue: sender.tag, isOn: seven)
            if seven { sevenBttn.alpha = 0.3 } else {  sevenBttn.alpha = 1.0 }
        default: break
        }
    }
}

