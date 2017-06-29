//
//  CycleEventView.swift
//  clue
//
//  Created by Matthew Lewis on 6/25/17.
//  Copyright © 2017 Matthew Lewis. All rights reserved.
//

import UIKit

class CycleEventView: UIView {

    let cycleEvent : CycleEvent
    
    init(frame: CGRect,cycleEvent : CycleEvent) {
        
        self.cycleEvent = cycleEvent
        super.init(frame: frame)
  
    
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
