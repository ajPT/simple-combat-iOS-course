//
//  Troll.swift
//  combat-oop
//
//  Created by Amadeu Andrade on 13/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import Foundation

class Troll: Character {

    //COMPUTED PROPERTIES
    override var attackDiff: Int {
        return 30
    }
    
    override var type: CharacterType {
        get {
            return CharacterType.troll
        }
        set {
            super.type = newValue
        }
    }

}

