//
//  EventRegisterButton.swift
//  clue
//
//  Created by Matthew Lewis on 7/1/17.
//  Copyright © 2017 Matthew Lewis. All rights reserved.
//

import UIKit

class EventRegisterButton: UIButton {

    var cycleEvent : CycleEvent?
    
    func loadWithCycleEvent(cycleEvent : CycleEvent){
        self.setTitle(cycleEvent.displayString(), for: .normal)
        self.cycleEvent = cycleEvent
        
        if (self.cycleEvent?.eventRegistered)!{
            self.backgroundColor = UIColor.red
        }
        else{
            self.backgroundColor = UIColor.gray
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if(self.cycleEvent?.eventRegistered)!{
            self.cycleEvent?.eventRegistered = false
            self.backgroundColor = UIColor.gray
        }
        else{
            self.cycleEvent?.eventRegistered = true
            self.backgroundColor = UIColor.red

        }
    }

}
