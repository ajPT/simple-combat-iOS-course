//
//  Character.swift
//  combat-oop
//
//  Created by Amadeu Andrade on 13/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import Foundation

class Character {
    //PRIVATE PROPERTIES
    private var _hp: Int = 100
    private var _attackPwr: Int = 10
    private var _name: String = "No_Name"
    
    //COMPUTED PROPERTIES
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var name: String {
        get {
            return _name
        }
    }
    
    //INITIALIZERS
    init() {
        
    }
    
    init(name: String, startingHp: Int, attackPwr: Int) {
        self._name = name
        self._hp = startingHp
        self._attackPwr = attackPwr
    }
    
    //METHODS
    func isAlive() -> Bool {
        if _hp <= 0 {
            return false
        } else {
            return true
        }
    }
    
    func isAttacked(attackPwr: Int) {
        self._hp -= attackPwr
    }
    
}