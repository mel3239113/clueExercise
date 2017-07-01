//
//  CycleViewController.swift
//  clue
//
//  Created by Matthew Lewis on 6/25/17.
//  Copyright © 2017 Matthew Lewis. All rights reserved.
//

import UIKit

class CycleViewController: UIViewController {
    
    let calenderBtn     = UIButton()
    var cycle           = Cycle(cycleEvents: [])

    struct Dimensions {
        
        static let XMargin : CGFloat = 20
        static let CalenderButtonHeight : CGFloat = 44
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calendar = Calendar.current
        let date = Date()
        let range = calendar.range(of: .day, in: .month, for: date)!
        let month = calendar.component(.month, from: date)
        
        var cycleEvents : [CycleEvent] = []
        for dayNumber in 0..<range.count {
            let cycleEvent = CycleEvent(day: dayNumber, month: month, eventRegistered : false,active: true)
            cycleEvents.append(cycleEvent)
        }
        
        self.cycle = Cycle(cycleEvents:cycleEvents)
        let cycleView = CycleView(frame: self.view.frame, cycle: cycle)
        cycleView.center = self.view.center;
        self.view.addSubview(cycleView)
        self.setupCalenderBtn()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupCalenderBtn() {
        
        self.calenderBtn.setTitle("Calender", for: .normal)
        self.calenderBtn.frame = CGRect(x: Dimensions.XMargin, y: self.view.frame.maxY - 66, width: self.view.frame.width - Dimensions.XMargin - Dimensions.XMargin, height: 44)
        
        self.calenderBtn.backgroundColor = UIColor.gray
        self.calenderBtn.layer.cornerRadius = 5
        self.calenderBtn.setTitleColor(UIColor.red, for: .highlighted)
        self.calenderBtn.addTarget(self, action: #selector(CycleViewController.pushToCalendarView), for: .touchUpInside)
        self.view.addSubview(self.calenderBtn)
    }
    
    func pushToCalendarView() {
    
        let detailView = DetailTableViewController(events: self.cycle.activeEvents())
        self.navigationController?.pushViewController(detailView, animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor.red

    }
}
