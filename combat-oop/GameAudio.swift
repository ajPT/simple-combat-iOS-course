//
//  GameAudio.swift
//  combat-oop
//
//  Created by Amadeu Andrade on 15/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import Foundation
import AVFoundation

class GameAudio {
    
    //PROPERTIES
    var soldierDieSound: AVAudioPlayer!
    var soldierAttackSound: AVAudioPlayer!
    var trollDieSound: AVAudioPlayer!
    var trollAttackSound: AVAudioPlayer!
    var selectionScreenSound: AVAudioPlayer!
    
    //INITIALIZER
    init() {
        initSelScreenAudio()
        initSoldierAudio()
        initTrollAudio()
    }
    
    //METHODS
    func initSelScreenAudio() {
        //sound for selection screen
        let pathSelectScreen = NSBundle.mainBundle().pathForResource("selection.screen.loop", ofType: "wav")
        let selectScreenSoundUrl = NSURL(fileURLWithPath: pathSelectScreen!)
        
        do {
            try selectionScreenSound = AVAudioPlayer(contentsOfURL: selectScreenSoundUrl)
            selectionScreenSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func initSoldierAudio() {
        //DIE
        let pathSoldierDie = NSBundle.mainBundle().pathForResource("knight_die", ofType: "wav")
        let soldierDieSoundUrl = NSURL(fileURLWithPath: pathSoldierDie!)
        
        do {
            try soldierDieSound = AVAudioPlayer(contentsOfURL: soldierDieSoundUrl)
            soldierDieSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        //ATTACK
        let pathSoldierAttack = NSBundle.mainBundle().pathForResource("knight.scream", ofType: "wav")
        let soldierAttackSoundUrl = NSURL(fileURLWithPath: pathSoldierAttack!)
        
        do {
            try soldierAttackSound = AVAudioPlayer(contentsOfURL: soldierAttackSoundUrl)
            soldierAttackSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func initTrollAudio() {
        //DIE
        let pathTrollDie = NSBundle.mainBundle().pathForResource("orc_die", ofType: "wav")
        let trollDieSoundUrl = NSURL(fileURLWithPath: pathTrollDie!)
        
        do {
            try trollDieSound = AVAudioPlayer(contentsOfURL: trollDieSoundUrl)
            trollDieSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        //ATTACK
        let pathTrollAttack = NSBundle.mainBundle().pathForResource("orc.scream", ofType: "wav")
        let trollAttackSoundUrl = NSURL(fileURLWithPath: pathTrollAttack!)
        
        do {
            try trollAttackSound = AVAudioPlayer(contentsOfURL: trollAttackSoundUrl)
            trollAttackSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func playDieSound(type: Character.CharacterType) {
        if type == .soldier && !soldierDieSound.playing {
            soldierDieSound.play()
        } else if type == .soldier {
            soldierDieSound.stop()
            soldierDieSound.currentTime = 0
            soldierDieSound.play()
        } else if type == .troll && !trollDieSound.playing {
            trollDieSound.play()
        } else if type == .troll {
            trollDieSound.stop()
            trollDieSound.currentTime = 0
            trollDieSound.play()
        }
    }
    
    func playAttackSound(type: Character.CharacterType) {
        if type == .soldier && !soldierAttackSound.playing {
            soldierAttackSound.play()
        } else if type == .soldier {
            soldierAttackSound.stop()
            soldierAttackSound.currentTime = 0
            soldierAttackSound.play()
        } else if type == .troll && !trollAttackSound.playing {
            trollAttackSound.play()
        } else if type == .troll {
            trollAttackSound.stop()
            trollAttackSound.currentTime = 0
            trollAttackSound.play()
        }
    }
    
    func playSelectionScreenSound(todo: Bool) {
        if todo {
            selectionScreenSound.play()
        } else {
            selectionScreenSound.stop()
        }
    }
    
}