//
//  CycleEvent.swift
//  clue
//
//  Created by Matthew Lewis on 6/25/17.
//  Copyright © 2017 Matthew Lewis. All rights reserved.
//

import Foundation

class CycleEvent : NSObject {
    
    let day : Int!
    let month : Int!
    let monthName : String!
    var eventRegistered : Bool!
    var active : Bool = false
    
    init(day : Int , month : Int, eventRegistered : Bool, active : Bool ){
        
        self.day = day
        self.month = month
        self.eventRegistered = eventRegistered
        self.active = active
        
        let formatter = DateFormatter()
        let monthComponents = formatter.shortMonthSymbols
        self.monthName = monthComponents?[self.month]
    }
    
    func loadEventData() {
        
    }
    
    func displayString() ->String {
        return "\(day + 1) \(monthName!)"
    }

}
