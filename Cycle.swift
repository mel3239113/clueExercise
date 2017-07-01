//
//  Cycle.swift
//  clue
//
//  Created by Matthew Lewis on 6/25/17.
//  Copyright © 2017 Matthew Lewis. All rights reserved.
//

import Foundation
import UIKit

struct Cycle {
    
    let cycleEvents : [CycleEvent]
    
    init(cycleEvents: [CycleEvent]) {
        self.cycleEvents = cycleEvents
    }
    
    func findEventFromPercentage(percentageAsInt : Int) -> CycleEvent{
        
        let count = CGFloat(self.cycleEvents.count) / 100
        let eventPos = count * CGFloat(percentageAsInt)
        let intPos =  Int(round(Double(eventPos)))

        var pos = intPos - Constants.ArrayOffSet
        if (pos < 0){
            pos = 0
        }
        return self.cycleEvents[pos]
    }
    
    func activeEvents() -> [CycleEvent] {
        
        var activeEvents : [CycleEvent] = []
        for event in self.cycleEvents {
            if (event.eventRegistered){
                activeEvents.append(event)
            }
        }
        
        activeEvents.sort{ $0.day < $1.day }
        return activeEvents
    }

}

