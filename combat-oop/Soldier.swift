//
//  Soldier.swift
//  combat-oop
//
//  Created by Amadeu Andrade on 13/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import Foundation

class Soldier: Character {
    
    //COMPUTED PROPERTIES
    override var immunity: Int {
        get {
            return 5
        }
        set {
            self.immunity = newValue
        }
    }
    
    override var hp: Int {
        get {
            return super.hp
        }
        set {
            super.hp = newValue
        }
    }
    
    override var hpDiff: Int {
        return 10
    }
    
    override var type: String {
        return "Soldier"
    }
    
    //INITIALIZERS
    convenience init(name: String, immunity: Int) {
        self.init(name: name)
        self.immunity = immunity
    }
    
    //METHODS
    override func isAttacked(attackPwr: Int) {
        if attackPwr <= immunity {
            self.hp += 1
        } else {
            super.isAttacked(attackPwr)
        }
    }
    
    
}