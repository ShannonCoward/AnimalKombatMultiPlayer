//
//  PlayerStats.swift
//  StuffedAnimalMortalKombatMultiPlayer
//
//  Created by Shannon Armon on 6/12/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit

class PlayerStats: UIView {

    @IBOutlet weak var energyBar: UIView!

    @IBOutlet weak var healthBar: UIView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var livesStats: UIView!
    
    
    @IBOutlet weak var killStats: StatsKills!

}
