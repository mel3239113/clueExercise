//
//  DetailTableViewController.swift
//  clue
//
//  Created by Matthew Lewis on 7/1/17.
//  Copyright © 2017 Matthew Lewis. All rights reserved.
//

import UIKit
import CoreData

class DetailTableViewController: UITableViewController {

    var events: [CycleEvent]
    
    init(events:[CycleEvent]){
        self.events = events
        super.init(nibName: nil, bundle: nil)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title =  "Selected dates"

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.events.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let event = self.events[indexPath.row]
        cell.textLabel?.text = event.displayStringLong()
        return cell
    }
    

  
}
