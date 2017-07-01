//
//  Cycle.swift
//  clue
//
//  Created by Matthew Lewis on 6/25/17.
//  Copyright © 2017 Matthew Lewis. All rights reserved.
//

import Foundation
import UIKit

protocol CycleDelegate  {
    
    func getCurrentEvent() ->CycleEvent
    
}

struct Cycle {
    
    let cycleEvents : [CycleEvent]
    
    init(cycleEvents: [CycleEvent]) {
        
        self.cycleEvents = cycleEvents
    }
    
    func findEventFromPercentage(percentageAsInt : Int) -> CycleEvent{
        
        let count = CGFloat(self.cycleEvents.count) / 100
        let eventPos = count * CGFloat(percentageAsInt)
        let intPos =  Int(round(Double(eventPos)))
        print(intPos - 1)
        var pos = intPos - 1
        if(pos < 0){
            pos = 0
        }
        return self.cycleEvents[pos]
    }
}

