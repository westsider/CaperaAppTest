//
//  Defaults.swift
//  TestTarget
//
//  Created by Warren Hansen on 1/13/21.
//

import Foundation

class MyDefaults {
    
    let defaults = UserDefaults.standard
    func setButton(forValue: Int, isOn:Bool) {
        defaults.set(isOn, forKey: "button\(forValue)")
    }
    func getButton(forValue: Int)-> Bool {
        return defaults.bool(forKey: "button\(forValue)")
    }
}
