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
    let monthShort : String!
    let monthNameLong : String!
    var eventRegistered : Bool!
    
    init(day : Int , month : Int, eventRegistered : Bool, active : Bool ){
        
        self.day = day
        self.month = month
        self.eventRegistered = eventRegistered
        
        var monthIndex = self.month - Constants.ArrayOffSet
        if (monthIndex < 0){
            monthIndex = 0
        }
        
        let formatter = DateFormatter()
        let monthComponentsShort = formatter.shortMonthSymbols
        self.monthShort = monthComponentsShort?[monthIndex]
        
        let monthComponentsLong = formatter.monthSymbols
        self.monthNameLong = monthComponentsLong?[monthIndex]

    }
    
    func displayString() ->String {
        return "\(day + Constants.ArrayOffSet) \(monthShort!)"
    }
    
    func displayStringLong() ->String {
        return "\(day + Constants.ArrayOffSet) \(monthNameLong!)"
    }

}
