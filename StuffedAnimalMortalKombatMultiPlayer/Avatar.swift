//
//  Avatar.swift
//  StuffedAnimalMortalKombatMultiPlayer
//
//  Created by Shannon Armon on 6/10/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

@IBDesignable class Avatar: UIView {

    @IBInspectable var healthPoints: CGFloat = 100
    @IBInspectable var energyPoints: CGFloat = 80
    
    @IBInspectable var healthColor: UIColor = UIColor.redColor()
    @IBInspectable var energyColor: UIColor = UIColor.greenColor()
    
    @IBInspectable var lightHealth: UIColor = UIColor.lightGrayColor()
    @IBInspectable var lightEnergy: UIColor = UIColor.lightGrayColor()
    
    override func drawRect(rect: CGRect) {
    
        // PIECE OF PAPER
        let context = UIGraphicsGetCurrentContext()
        
        // LINE WIDTH OR BAR WIDTH
        let lineWidth: CGFloat = 10
        CGContextSetLineWidth(context, lineWidth)
        
        // CIRCLE FOR THE BAR
        let barRect = CGRectInset(rect, lineWidth / 2, lineWidth /  2)
        
        // LEFT BAR
        lightHealth.set()
        CGContextStrokeEllipseInRect(context, barRect)
        
        // RIGHT BAR
        CGContextSetBlendMode(context, kCGBlendModeSourceIn)
        lightEnergy.set()
        CGContextFillRect(context, CGRectMake(rect.width / 2, 0, rect.width / 2, rect.height))
        
        //REMOVE OTHRE PARTS OF CIRCLE
        CGContextSetBlendMode(context, kCGBlendModeClear)
        CGContextMoveToPoint(context, 0, 0) // TOP LEFT //////
        CGContextAddLineToPoint(context, rect.width, 0) ///// TOP RIGHT//
        CGContextAddLineToPoint(context, rect.width / 2, rect.height / 2) // CENTER
        CGContextAddLineToPoint(context, rect.width, rect.height) //BOTTME RIGHT
        CGContextAddLineToPoint(context, 0, rect.height) //BOTTOM LEFT
        CGContextAddLineToPoint(context, rect.width / 2, rect.height / 2) // CENTER
        CGContextFillPath(context)
        
        // RESET BLEND TO NORMAL
        CGContextSetBlendMode(context, kCGBlendModeNormal)
        
        // ADD BAR ROUNDED ENDS
        addDotAtDegrees(-135, withColor: lightHealth, andContext: context)
        addDotAtDegrees(135, withColor: lightHealth, andContext: context)
        
        addDotAtDegrees(-45, withColor: lightEnergy, andContext: context)
        addDotAtDegrees(45, withColor: lightEnergy, andContext: context)
        
        
        // ADD CURRENT HEALTH
        CGContextSetBlendMode(context, kCGBlendModeSourceIn)
        
        let  healthY = (1.0 - (healthPoints / 100)) * rect.height
        
            healthColor.set()
        
        let degrees = Double(((healthPoints / 100) * 90) + 135)
        
        let angle = CGFloat(DegreesToRadians(degrees))
        
        let x = (rect.width / 2) + (rect.width) * cos(angle)
        let y = (rect.height / 2) + (rect.height) * sin(angle)
        
        CGContextMoveToPoint(context, x, y);
        CGContextAddLineToPoint(context, rect.width / 2, rect.height / 2)
        CGContextAddLineToPoint(context, 0, rect.height)
        CGContextFillPath(context)
        
        
        addDotAtDegrees(degrees, withColor: healthColor, andContext: context)
        addDotAtDegrees(135, withColor: healthColor, andContext: context)
        
         // ADD CURRENT ENERGY
        
        CGContextSetBlendMode(context, kCGBlendModeSourceIn)
        
         energyColor.set()
        
        let  oppoDegrees = Double(45 - ((energyPoints / 100) * 90))
        let oppoAngle = CGFloat(DegreesToRadians(oppoDegrees))
        
        
        let newX = (rect.width / 2) + (rect.width) * cos(oppoAngle)
        let newY = (rect.height / 2) + (rect.height) * sin(oppoAngle)
        
        CGContextMoveToPoint(context, newX, newY);
        CGContextAddLineToPoint(context, rect.width / 2, rect.height / 2)
        CGContextAddLineToPoint(context, rect.width, rect.height)
        CGContextFillPath(context)
        
        
        addDotAtDegrees(degrees, withColor: energyColor, andContext: context)
        addDotAtDegrees(135, withColor: energyColor, andContext: context)
        
        
        
        
        CGContextSetBlendMode(context, kCGBlendModeNormal)
        
        
        // AVATAR CIRCLE
        UIColor.lightGrayColor().set()
        
        let avatarRect = CGRectInset(rect, 15, 15)
        
        CGContextFillEllipseInRect(context, avatarRect)
        
    }
    
    func addDotAtDegrees(degrees: Double, withColor color: UIColor, andContext context :CGContextRef) {
    
    let angle = CGFloat(DegreesToRadians(degrees))
    
        let x = ((bounds.width / 2) + (bounds.width / 2 - 5) * cos(angle))
        let y = ((bounds.height / 2) + (bounds.height / 2 - 5) * sin(angle))

    
    println("x \(x) y \(y)")
    
    color.set()
    CGContextSetLineCap(context, kCGLineCapRound)
    
    CGContextMoveToPoint(context, x, y)
    CGContextAddLineToPoint(context, x, y)
        
    CGContextStrokePath(context)
    
    }
    
}


//        var cirlcePath = UIBezierPath(ovalInRect: barRect)
//
//        var removeRightPath = UIBezierPath()
//        removeRightPath.moveToPoint(CGPointMake(0, 0))//Top left
//        removeRightPath.moveToPoint(CGPointMake(rect.width, 0))// Top right
//        removeRightPath.moveToPoint(CGPointMake(rect.width, rect.height)) //br
//        removeRightPath.moveToPoint(CGPointMake(0, rect.height)) // BL
//        removeRightPath.moveToPoint(CGPointMake(rect.width / 2, rect.height / 2)) //CENTER
//        removeRightPath.moveToPoint(CGPointMake(0, 0)) //T





