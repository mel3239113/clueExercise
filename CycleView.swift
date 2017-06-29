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

    struct Dimensions {
        
        static let YMargin : CGFloat = 44
        static let XMargin : CGFloat = 20
        static let CalenderButtonHeight : CGFloat = 44
    }
    
    init(frame: CGRect,cycle : Cycle) {
        self.cycle = cycle
        super.init(frame: frame)
        
        
        let circularViewFrame = CGRect(x:Dimensions.XMargin, y: Dimensions.YMargin, width: self.frame.width - Dimensions.XMargin * 2, height: self.frame.height - Dimensions.YMargin - Dimensions.CalenderButtonHeight - Dimensions.YMargin )
        
        let circularView = CircularView(frame: circularViewFrame)
        circularView.addTarget(self, action: #selector(CycleView.newValue(slider:)), for: .valueChanged)
        self.addSubview(circularView)
        
        self.setupCalenderBtn()
        self.setupCurrentDayBtn()
        
    }
    
    func newValue(slider : CircularView) {
     
        print(slider.angle)
        self.currentDayBtn.setTitle(slider.angle.description, for: .normal)
        
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
    
    func setupCalenderBtn() {
      
        self.calenderBtn.setTitle("Calender", for: .normal)
     
        
        self.calenderBtn.frame = CGRect(x: Dimensions.XMargin, y: self.frame.maxY - 66, width: self.frame.width - Dimensions.XMargin - Dimensions.XMargin, height: 44)
        
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
    
}
