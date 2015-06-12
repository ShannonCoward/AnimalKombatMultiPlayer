//
//  StatsKills.swift
//  StuffedAnimalMortalKombatMultiPlayer
//
//  Created by Shannon Armon on 6/12/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

@IBDesignable class StatsKills: UIView {

    @IBInspectable var killCount: Int = 0 {
        
        didSet { setNeedsDisplay() }
        
    }
    
    @IBInspectable var padding: CGFloat = 5
    @IBInspectable var color: UIColor = UIColor.blackColor()
    @IBInspectable var killsPerLine: CGFloat = 10
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        let hW = (rect.width - ((killsPerLine - 1) * padding)) / killsPerLine
        
        color.set()

        for i in 0..<killCount {
        
            let x = (hW + padding) * (CGFloat(i) % killsPerLine)
            let y = (hW + padding) * floor(CGFloat(i) / killsPerLine)
            
            CGContextFillEllipseInRect(context, CGRectMake(x, y, hW, hW))
            
        }
        
    }

}
