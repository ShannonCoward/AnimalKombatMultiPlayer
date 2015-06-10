//
//  UserControllerViewController.swift
//  StuffedAnimalMortalKombatMultiPlayer
//
//  Created by Shannon Armon on 6/9/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

//normal

// - directional buttons
// - attack buttons
// - health bar
// - points
// - energy bar

// Hard

//- skin selector? maybe a new view controller
// - way to set your name
// - way to approve invite (action aler view contoller) call if user accepts
// - join and leave buttons

//Nightmare mode

// - start connecting buttons to actions  join and leave session
// - skin pixe designer of take a pictrue for the character


class UserControllerViewController: UIViewController {
    
    
    @IBAction func attackButton(sender: AnyObject) {
    }

    
    
    @IBAction func specialAttackButton(sender: UIButton) {
    }
    
    
    
    @IBAction func moveButtonReleased(sender: UIButton) {
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Connector.sharedConnector().startAdvertising()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
