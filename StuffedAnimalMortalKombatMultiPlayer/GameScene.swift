//
//  GameScene.swift
//  StuffedAnimalMortalKombatMultiPlayer
//
//  Created by Shannon Armon on 6/9/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import SpriteKit


class GameScene: SKScene {
    
    let playerCount: CGFloat = 8
    let statsPadding: CGFloat = 20
    
    var playerStatsWidth: CGFloat!
    
    
    override func didMoveToView(view: SKView) {
        
     
        
        playerStatsWidth = (view.bounds.width -  (statsPadding * (playerCount + 1))) / playerCount
        
//        
//       ////////// /* Setup your scene here */////////
//        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
//        myLabel.text = "Hello, World!";
//        myLabel.fontSize = 65;
//        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
//        
//        self.addChild(myLabel)
    }
    
    
    
        //
    
        var sunRotation: Double = 0
    
        override func update(currentTime: CFTimeInterval) {
            /* Called before each frame is rendered */
    
            if let sun = childNodeWithName("sun") {
    
    //     let radBius = DistanceBetweenPoint1(sun.position, andPoint2: view!.center)
    
                let radius: CGFloat = 700
    
                sunRotation = sunRotation < 360 ? sunRotation + 1 : 0
    
                let angle =  CGFloat(DegreesToRadians(sunRotation))
    
    //            let x = (position.x / 2) + radius * cos(angle)
    //            let y = (position.y + radius * sin(angle)
    
                sun.position.x = position.x + radius * cos(angle) + view!.center.x
                sun.position.y = position.y + radius * sin(angle) + view!.center.y
    
    //            sun.position.x+=5 //x++ //<==Move to the right 1 space
            }
        }

}
