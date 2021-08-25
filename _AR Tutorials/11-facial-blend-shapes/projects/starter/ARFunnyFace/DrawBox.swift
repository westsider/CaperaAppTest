//
//  DrawBox.swift
//  ARFunnyFace
//
//  Created by Warren Hansen on 8/2/21.
//  Copyright © 2021 Razeware LLC. All rights reserved.
//

import UIKit

@IBDesignable class DrawView: UIView {

    var boxVertColor: CGColor? {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var boxHorizonColor: CGColor? {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var vertColor: CGColor? {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var horizontColor: CGColor? {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawBoxHorizontals(rect, color: self.boxHorizonColor ?? UIColor.white.cgColor)
        drawBoxVerticals(rect, color: self.boxVertColor ?? UIColor.white.cgColor)
        drawVerticle(rect, color: self.vertColor ?? UIColor.white.cgColor)
        drawHorizontal(rect, color: self.horizontColor ?? UIColor.white.cgColor)
    }
    
    func drawBoxVerticals(_ rect: CGRect, color: CGColor) {
        super.draw(rect)
        self.backgroundColor = UIColor.clear
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2.0)
        context?.setStrokeColor(color)
        context?.move(to: CGPoint(x: 1, y: 1))
        context?.addLine(to: CGPoint(x: 1, y: self.frame.height - 1))
        context?.move(to: CGPoint(x: self.frame.width - 1, y: self.frame.height - 1))
        context?.addLine(to: CGPoint(x: self.frame.width - 1, y:  1))
        context?.strokePath()
    }
    
    func drawBoxHorizontals(_ rect: CGRect, color: CGColor) {
        super.draw(rect)
        self.backgroundColor = UIColor.clear
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2.0)
        context?.setStrokeColor(color)
        context?.move(to: CGPoint(x: 1, y: self.frame.height - 1))
        context?.addLine(to: CGPoint(x: self.frame.width - 1, y: self.frame.height - 1))
        context?.move(to: CGPoint(x: self.frame.width - 1, y: 1))
        context?.addLine(to: CGPoint(x: 1, y: 1))
        context?.strokePath()
    }
    
    func drawVerticle(_ rect: CGRect, color: CGColor) {
        super.draw(rect)
        self.backgroundColor = UIColor.clear
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(1.0)
        context?.setStrokeColor(color)
        context?.move(to: CGPoint(x: self.frame.width / 2, y: 1))
        context?.addLine(to: CGPoint(x: self.frame.width / 2, y: self.frame.height - 1))
        context?.strokePath()
    }
    
    func drawHorizontal(_ rect: CGRect, color: CGColor) {
        super.draw(rect)
        self.backgroundColor = UIColor.clear
        // small line
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(1.0)
        context?.setStrokeColor(color)
        let start = self.frame.height / 2
        let oneThirdWidth = self.frame.width / 3
        context?.move(to: CGPoint(x: oneThirdWidth, y: start))
        context?.addLine(to: CGPoint(x: oneThirdWidth * 2, y: start))
        context?.strokePath()
        
        // small line
        let context2 = UIGraphicsGetCurrentContext()
        context2?.setLineWidth(1.0)
        context2?.setStrokeColor(color)
        let heightMulti: CGFloat = 2.4
        context2?.move(to: CGPoint(x: 1, y: self.frame.height / heightMulti ))
        context2?.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height / heightMulti ))
        context2?.strokePath()
    }
}
