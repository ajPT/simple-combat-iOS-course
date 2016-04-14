//
//  Soldier.swift
//  combat-oop
//
//  Created by Amadeu Andrade on 13/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import Foundation

class Soldier: Character {
    //PROPERTIES
    private var _immunity: Int = 5
    
    //COMPUTED PROPERTIES
    override var hpDiff: Int {
        return 10
    }
    
    var immunity: Int {
        get {
            return _immunity
        }
    }
    
    override var hp: Int {
        get {
            return getRandomHp()
        }
        set {
            self.hp = newValue
        }
    }
    
    override var attackPwr: Int {
        return getRandomAttackPwr()
    }
    
    //METHODS
    override func isAttacked(attackPwr: Int) {
        if attackPwr <= immunity {
            hp += 1
        } else {
            super.isAttacked(attackPwr)
        }
    }
    
    
}