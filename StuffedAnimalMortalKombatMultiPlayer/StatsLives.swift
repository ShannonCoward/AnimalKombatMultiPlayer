//
//  StatsLives.swift
//  StuffedAnimalMortalKombatMultiPlayer
//
//  Created by Shannon Armon on 6/12/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

@IBDesignable class StatsLives: UIView {

    @IBInspectable var lifeCount: Int = 3 {
    
        didSet { setNeedsDisplay() }
    
    }
    
    
    @IBInspectable var padding : CGFloat = 5
    @IBInspectable var color: UIColor = UIColor.blackColor()
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        let hW = rect.height
        
        color.set()
        
        for i in 0..<lifeCount {
            
            let x = rect.width - hW - ((hW + 5) * CGFloat(i))
            
            let lifeRect = CGRectMake(x, 0, hW, hW)
        
            CGContextFillEllipseInRect(context, lifeRect)
        
        
        }
        
    }
    

}
