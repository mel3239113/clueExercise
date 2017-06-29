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
    var circlePath : UIBezierPath?

    override func draw(_ rect: CGRect) {
        
         let ctx = UIGraphicsGetCurrentContext();
         ctx?.clear(rect)
        self.drawHandler(ctx: ctx!)
        
        if(self.circlePath == nil){
           
            self.circlePath = UIBezierPath(arcCenter:CGPoint(x:self.frame.width / 2,y:self.frame.width - self.frame.width / 4), radius: self.frame.width / 2, startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)

            let circleLayer = CAShapeLayer()
            circleLayer.path = self.circlePath?.cgPath
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.strokeColor = UIColor.gray.cgColor
            circleLayer.lineWidth = 10
            self.layer.addSublayer(circleLayer)
        }

    }
    
    func drawHandler(ctx : CGContext){
        
        ctx.saveGState()
        
        let pointOfIndicator  = self.pointFromAngle(angle: Int(self.angle))
        let indicatorRectangle = CGRect(x: pointOfIndicator.x, y: pointOfIndicator.y, width: 40, height: 40)
        ctx.setFillColor(UIColor.red.cgColor)
        ctx.fillEllipse(in: indicatorRectangle)
        
        ctx.restoreGState()

    }
    
    private func pointFromAngle(angle : Int) -> CGPoint{
    
        let centerPoint = CGPoint(x: self.frame.size.width/2.0 - 40/2.0,y: self.frame.size.height/2.0 - 40/2.0);
     
        var result:CGPoint = CGPoint()
        let y = round(Double(self.frame.width / 2 - CycleView.Dimensions.XMargin) * sin(DegreesToRadians(value: Double(-angle)))) + Double(centerPoint.y)
        
        let x = round(Double(self.frame.width / 2 - CycleView.Dimensions.XMargin) * cos(DegreesToRadians(value: Double(-angle)))) + Double(centerPoint.x)
        
        result.y = CGFloat(y)
        result.x = CGFloat(x)
        
        return result;

    }
    
    func DegreesToRadians (value:Double) -> Double {
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
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
    }
    
    private func moveHandle(lastPoint : CGPoint){
        
        let centerPoint = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        let currentAngle = pointToBearingDegrees(startPoint: centerPoint, lastPoint: lastPoint)
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


