//
//  Resources.swift
//  HackingWithSwiftTrees
//
//  Created by Warren Hansen on 1/8/21.
//

import Foundation

public func example(of description: String, action: () -> Void) {
  print("---Example of: \(description)---")
  action()
  print()
}
