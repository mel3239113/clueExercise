//
//  Cycle.swift
//  clue
//
//  Created by Matthew Lewis on 6/25/17.
//  Copyright © 2017 Matthew Lewis. All rights reserved.
//

import Foundation

protocol CycleDelegate  {
    
    func getCurrentEvent() ->CycleEvent
    
}

struct Cycle {
    
    let cycleEvents : [CycleEvent]
    
    init(cycleEvents: [CycleEvent]) {
        
        self.cycleEvents = cycleEvents
    }
    
}

