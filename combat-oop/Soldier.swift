//
//  Soldier.swift
//  combat-oop
//
//  Created by Amadeu Andrade on 13/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import Foundation
import UIKit

class Soldier: Character {

    //PROPERTIES
    private var _immunity = 5
    
    //COMPUTED PROPERTIES
    var immunity: Int {
        return _immunity
    }
    
    override var hp: Int {
        get {
            return super.hp
        }
        set {
            self.hp = newValue
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
        _immunity = immunity
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