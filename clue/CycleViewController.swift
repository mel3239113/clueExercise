//
//  CycleViewController.swift
//  clue
//
//  Created by Matthew Lewis on 6/25/17.
//  Copyright © 2017 Matthew Lewis. All rights reserved.
//

import UIKit

class CycleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calendar = Calendar.current
        let date = Date()
        let range = calendar.range(of: .day, in: .month, for: date)!
        let month = calendar.component(.month, from: date)
        
        
        let day = calendar.component(.day, from: date)
      //Setup CycleEvents
        
        var cycleEvents : [CycleEvent] = []
        for dayNumber in 0..<range.count {
            
            let registeredEvent = self.queryRegistered(dayNumber: dayNumber, month: month)
            if(dayNumber == day){
                
                let cycleEvent = CycleEvent(day: dayNumber, month: month, eventRegistered : registeredEvent,active: true)
                cycleEvents.append(cycleEvent)

            }
            else{
                let cycleEvent = CycleEvent(day: dayNumber, month: month, eventRegistered : registeredEvent,active: false)
                cycleEvents.append(cycleEvent)

            }
            
            
        }
        
        let cycle = Cycle(cycleEvents:cycleEvents)
        
        
        let cycleView = CycleView(frame: self.view.frame, cycle: cycle)
        cycleView.center = self.view.center;
        self.view.addSubview(cycleView)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func queryRegistered(dayNumber : Int , month : Int) -> Bool {
        
        if(dayNumber == 21 || dayNumber == 3 || dayNumber == 1 || dayNumber == 7 || dayNumber == 4){
            
            return true
        }
        else{
            return false
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
