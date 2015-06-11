//
//  PawButton.swift
//  StuffedAnimalMortalKombatMultiPlayer
//
//  Created by Shannon Armon on 6/11/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

@IBDesignable class PawButton: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.cyanColor()
    @IBInspectable var pawColor: UIColor = UIColor.whiteColor()
    
    @IBInspectable var pawInset: CGFloat = 0
   

    override func drawRect(rect: CGRect) {
        // Drawing code
        
        let scaleX = (rect.width - pawInset * 2) / 250
        let scaleY = (rect.height - pawInset * 2) / 250
        
        let context = UIGraphicsGetCurrentContext()
        
        fillColor.set()

        
        CGContextFillEllipseInRect(context, rect)
         CGContextTranslateCTM(context, pawInset, pawInset)
        CGContextScaleCTM(context, scaleX, scaleY)
       
        
        pawColor.set()
        
        let circles: [(CGFloat, CGFloat, CGFloat)] = [
        
            (133.6, 158.5, 63.6),  //<------Tuples
            (208, 85.4, 19.7),
            (42, 114, 19.7),
            (153.9, 54.2, 25.4),
            (82.4, 62.2, 28.3)
        ]
        
//        for circle in circles 
                    for (cx,cy,r) in circles  {
        
        
        CGContextFillEllipseInRect(context, CGRectMake(cx - r, cy - r, r * 2, r * 2))
                        
    // CGRectMake circle["cx"]! - circle["r"]!, circle["cy"]! - circle["r"]!, circle["r"]! * 2, circle ["r"]! * 2))
        
    
//        cx="133.6" cy="158.5" r="63.6"
//        cx="208" cy="85.4" r="19.7"
//        cx="42" cy="114" r="19.7"
//        cx="153.9" cy="54.2" r="25.4"
//        cx="82.4" cy="62.2" r="28.3"
        }
    }

}
