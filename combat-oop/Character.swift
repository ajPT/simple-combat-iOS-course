//
//  Character.swift
//  combat-oop
//
//  Created by Amadeu Andrade on 13/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import Foundation

class Character {
    
    enum CharacterType {
        case soldier
        case troll
        case other
    }
    
    //PRIVATE PROPERTIES
    private var _hp = 100
    private var _attackPwr = 20
    private var _name = "No_Name"
    private var _hpDiff = 20
    private var _attackDiff = 25
    private var _type = CharacterType.other
    private var _immunity = 0
    
    //COMPUTED PROPERTIES
    var hp: Int {
        get {
            return _hp
        }
        set {
            _hp = newValue
        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
        set {
            _attackPwr = newValue
        }
    }
    
    var hpDiff: Int {
        return _hpDiff
    }
    
    var attackDiff: Int {
        return _attackDiff
    }
    
    var name: String {
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }
    
    var type: CharacterType {
        get {
            return _type
        }
        set {
            _type = newValue
        }
    }
    
    var immunity: Int {
        return _immunity
    }
    
    //INITIALIZERS
    init(name: String) {
        self._hp = getRandomHp()
        self._attackPwr = getRandomAttackPwr()
        self._name = name
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
    
    func getRandomHp() -> Int {
        let newHp = Int(arc4random_uniform(UInt32(self._hpDiff))) + self._hp
        return newHp
    }
    
    func getRandomAttackPwr() -> Int {
        let newAP = Int(arc4random_uniform(UInt32(self._attackDiff)))
        return newAP
    }
    
}