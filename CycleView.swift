//
//  CycleView.swift
//  clue
//
//  Created by Matthew Lewis on 6/25/17.
//  Copyright © 2017 Matthew Lewis. All rights reserved.
//

import UIKit


class CycleView: UIView {
    
    let cycle           : Cycle
    let currentDayBtn   = EventRegisterButton()
    var circleCenter    = CGPoint()

    struct Dimensions {
        
        static let YMargin : CGFloat = 44
        static let XMargin : CGFloat = 20
        static let CalenderButtonHeight : CGFloat = 44
    }
    
    init(frame: CGRect,cycle : Cycle) {
        self.cycle = cycle
        super.init(frame: frame)
        
        let circularViewFrame = CGRect(x:Dimensions.XMargin, y: self.center.y - self.frame.width / 2, width: self.frame.width - Dimensions.XMargin * 2, height: self.frame.width )
        let circularView = CircularView(frame: circularViewFrame)
        circularView.backgroundColor = UIColor.clear
        circularView.addTarget(self, action: #selector(CycleView.sliderValueChanged(slider:)), for: .valueChanged)
        self.addSubview(circularView)
        circularView.setNeedsDisplay()

        self.setupCurrentDayBtn()
        self.sliderValueChanged(slider: circularView)
    }
    
    func sliderValueChanged(slider : CircularView) {
     
        let currentEvent = self.findCycleEventForPercentage(angle: slider.angle)
        self.currentDayBtn.loadWithCycleEvent(cycleEvent: currentEvent)
        
    }
    
    func findCycleEventForPercentage(angle : CGFloat) -> CycleEvent{
        
        let decimal = angle/360
        let percent = decimal*100
        let percentAsInteger = round(percent)
        return self.cycle.findEventFromPercentage(percentageAsInt: Int(percentAsInteger))
        
    }
    
    func setupCurrentDayBtn(){
        
        self.currentDayBtn.center = CGPoint(x:self.bounds.size.width / 2.0 - self.frame.width / CGFloat(4.0) / 2 , y:self.bounds.size.height / 2.0 - self.frame.width / CGFloat(4.0) / 2)
        self.currentDayBtn.frame.size = CGSize(width: self.frame.width / CGFloat(4.0), height: self.frame.width / CGFloat(4.0))
        self.currentDayBtn.layer.cornerRadius = self.currentDayBtn.frame.width/2
        self.currentDayBtn.layer.masksToBounds = true
        self.currentDayBtn.backgroundColor = UIColor.gray
        self.currentDayBtn.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        self.addSubview(self.currentDayBtn)
        
    }
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
