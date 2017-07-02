//
//  CycleEvent.swift
//  clue
//
//  Created by Matthew Lewis on 6/25/17.
//  Copyright © 2017 Matthew Lewis. All rights reserved.
//

import Foundation

class CycleEvent : NSObject,NSCoding {
    
    let day : Int!
    let month : Int!
    let monthShort : String!
    let monthNameLong : String!
    var eventRegistered : Bool!
    
    init(day : Int , month : Int, eventRegistered : Bool ){
        
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

    
    required convenience init(coder aDecoder: NSCoder) {
        
        let day = aDecoder.decodeObject(forKey: "day") as! Int
        let month = aDecoder.decodeObject(forKey: "month") as! Int
        let eventRegistered = aDecoder.decodeObject(forKey: "eventRegistered") as! Bool
        self.init(day: day, month: month, eventRegistered: eventRegistered)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.day, forKey: "day")
        aCoder.encode(self.month, forKey: "month")
        aCoder.encode(self.eventRegistered, forKey: "eventRegistered")
    }

    
}
