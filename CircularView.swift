//
//  CircularView.swift
//  clue
//
//  Created by Matthew Lewis on 6/29/17.
//  Copyright © 2017 Matthew Lewis. All rights reserved.
//

import UIKit

class CircularView: UIControl {


    override func draw(_ rect: CGRect) {

        self.backgroundColor = UIColor.red
        
        let path = UIBezierPath(ovalIn: rect)
        UIColor.green.setFill()
        path.fill()
        
    }
    

}
