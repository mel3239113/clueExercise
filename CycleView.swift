//
//  CycleView.swift
//  clue
//
//  Created by Matthew Lewis on 6/25/17.
//  Copyright © 2017 Matthew Lewis. All rights reserved.
//

import UIKit


class CycleView: UIView {
    // Subclass UIControl
    
    let cycle : Cycle

    var midViewX = CGFloat()
    var midViewY = CGFloat()
    var lastPosition = CGPoint()
    
    var circlePath2 = UIBezierPath()
    var indicator = CAShapeLayer()
    var margin = CGFloat()
    let lineWidth: CGFloat = 10


    let calenderBtn     = UIButton()
    let currentDayBtn   = UIButton()
    var circleCenter    = CGPoint()

    init(frame: CGRect,cycle : Cycle) {
        self.cycle = cycle

        super.init(frame: frame)
        self.calenderBtn.setTitle("Calendar", for: .normal)
        self.calenderBtn.frame = self.frame
        self.margin = self.frame.width / 8 // use a constant...what is 8??
        
        self.setupCurrentDayLabel()
        self.self.setupCalenderBtn()
        
        
        
        
    }
    
    func setupCurrentDayLabel(){
        
        self.currentDayBtn.center = CGPoint(x:self.bounds.size.width / 2.0 - self.frame.width / CGFloat(4.0) / 2 , y:self.bounds.size.height / 2.0 - self.frame.width / CGFloat(4.0) / 2)
        self.currentDayBtn.frame.size = CGSize(width: self.frame.width / CGFloat(4.0), height: self.frame.width / CGFloat(4.0))
        self.currentDayBtn.layer.cornerRadius = self.currentDayBtn.frame.width/2
        self.currentDayBtn.layer.masksToBounds = true
        self.currentDayBtn.backgroundColor = UIColor.gray
        self.currentDayBtn.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        self.addSubview(self.currentDayBtn)
        
    }
    
    func setupCalenderBtn() {
      
        self.calenderBtn.setTitle("Calender", for: .normal)
        self.calenderBtn.frame = CGRect(x: self.margin, y: self.frame.maxY - 66, width: self.frame.width - (self.margin * 2), height: 44)
        self.calenderBtn.backgroundColor = UIColor.darkGray
        self.calenderBtn.layer.cornerRadius = 5
        self.calenderBtn.layer.borderWidth = 1
        self.calenderBtn.setTitleColor(UIColor.blue, for: .highlighted)
        self.calenderBtn.addTarget(self, action: #selector(CycleView.loadDayData), for: .touchUpInside)
        self.addSubview(self.calenderBtn)
    }
    
    func loadDayData() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func indicatorPan(recognizer: UIPanGestureRecognizer) {
        let point = recognizer.location(in: self)
       
        let earthX = Double(point.x)
        let earthY = Double(point.y)
        let midViewXDouble = Double(midViewX)
        let midViewYDouble = Double(midViewY)
        
        let angleX = (earthX - midViewXDouble)
        let angleY = (earthY - midViewYDouble)
        
        let angle = atan2(angleY, angleX)
        let earthX2 = midViewXDouble + cos(angle) * Double(self.frame.width / 2 - margin)
        let earthY2 = midViewYDouble + sin(angle) * Double(self.frame.width / 2 - margin)
        
        // TODO: be consistent in usage of self or no self
        self.circlePath2 = UIBezierPath(arcCenter: CGPoint(x: earthX2,y: earthY2), radius: CGFloat(20), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        self.indicator.path = circlePath2.cgPath
        
        let x =  CGFloat((indicator.path?.currentPoint.x)!)
        let y =  CGFloat((indicator.path?.currentPoint.y)!)
        
        let frame  = CGFloat(self.frame.width / 2)
        
        if(x < frame ){
            
            if (y < self.circleCenter.y){
                print("first quad")
             //   self.currentDayBtn.setTitle("", for: <#T##UIControlState#>)
            }else{
                
                print("fourth quad")
            }
        }
        else{
            
            print("second half")
        }
        
        
       // print("x\(x) : y\(y)")
    }
    
}


extension CGPoint {
    
    func distance(_ b: CGPoint) -> CGFloat {
        let xDist = self.x - b.x
        let yDist = self.y - b.y
        return CGFloat(sqrt((xDist * xDist) + (yDist * yDist)))
    }
    
}
