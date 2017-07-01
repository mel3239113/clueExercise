//
//  CircularView.swift
//  clue
//
//  Created by Matthew Lewis on 6/29/17.
//  Copyright © 2017 Matthew Lewis. All rights reserved.
//

import UIKit

class CircularView: UIControl {

    var angle = CGFloat()
    
    struct Dimensions {
        static let IndicatorRadius : CGFloat = 40
    }

    override func draw(_ rect: CGRect) {

        let ctx = UIGraphicsGetCurrentContext();
        
        let circlePathFrame = CGRect(x: Dimensions.IndicatorRadius / 2, y: Dimensions.IndicatorRadius, width: self.frame.width - Dimensions.IndicatorRadius, height: self.frame.width - Dimensions.IndicatorRadius)
        ctx?.setStrokeColor(UIColor.gray.cgColor)
        ctx?.setLineWidth(10)
        ctx?.strokeEllipse(in: circlePathFrame)

        self.drawHandler(ctx: ctx!)
    }
    
    func drawHandler(ctx : CGContext){
        
        ctx.saveGState()
        
        let pointOfIndicator  = self.pointFromAngle(angle: Int(self.angle))
        
        let indicatorRectangle = CGRect(x: pointOfIndicator.x, y: pointOfIndicator.y, width: Dimensions.IndicatorRadius, height: Dimensions.IndicatorRadius)
        ctx.setFillColor(UIColor.red.cgColor)
        ctx.fillEllipse(in: indicatorRectangle)
    
        ctx.restoreGState()

    }
    
    private func pointFromAngle(angle : Int) -> CGPoint{
        //length of radius
        let centerPoint = CGPoint(x:self.frame.width / 2 - Dimensions.IndicatorRadius/2.0 ,y:self.frame.height / 2 - Dimensions.IndicatorRadius/2.0)
        
        var result:CGPoint = CGPoint()
        let y = round(Double(self.frame.width / 2 - Dimensions.IndicatorRadius / 2) * sin(self.degreesToRadians(value: Double(-angle)))) + Double(centerPoint.y)
        
        let x = round(Double(self.frame.width / 2 - Dimensions.IndicatorRadius / 2) * cos(self.degreesToRadians(value: Double(-angle)))) + Double(centerPoint.x)
        
        result.y = CGFloat(y)
        result.x = CGFloat(x)
        
        return result;

    }
    
    func degreesToRadians (value:Double) -> Double {
        return value * Double.pi / 180.0
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let lastPoint = touch.location(in: self)
        self.moveHandle(lastPoint: lastPoint)
        self.sendActions(for: .valueChanged)
        
        return true;
    }
    

    private func moveHandle(lastPoint : CGPoint){
        
        let centerPoint = CGPoint(x: self.frame.size.width/2 , y: self.frame.size.height/2)
        let currentAngle = self.pointToBearingDegrees(startPoint: centerPoint, lastPoint: lastPoint)
        let angleInt = floor(currentAngle)
        self.angle = 360 - angleInt;
        
        self.setNeedsDisplay()
        
    }
    
    private func pointToBearingDegrees(startPoint : CGPoint , lastPoint : CGPoint) -> CGFloat{
        
        let origin = CGPoint(x: lastPoint.x - startPoint.x, y: lastPoint.y - startPoint.y)
        let bearingRadians = atan2(origin.y, origin.x)
        var bearingDegrees = Double(bearingRadians) * (180 / Double.pi)
        bearingDegrees = (bearingDegrees > 0.0 ? bearingDegrees : (360.0 + bearingDegrees))
        return CGFloat(bearingDegrees)
        
    }

}


