//
//  ViewController.swift
//  combat-oop
//
//  Created by Amadeu Andrade on 13/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //PROPERTIES
    var player1: Character!
    var player2: Character!
    var player1Ready = false
    var player2Ready = false
    var player1InitHp = 0
    var player2InitHp = 0
    
    var trollRightImg: UIImage = UIImage(named: "enemy-right")!
    var trollLeftImg: UIImage = UIImage(named: "enemy-left")!
    var soldierRightImg: UIImage = UIImage(named: "player-right")!
    var soldierLeftImg: UIImage = UIImage(named: "player-left")!
    
    var soldierDieSound: AVAudioPlayer!
    var soldierAttackSound: AVAudioPlayer!
    var trollDieSound: AVAudioPlayer!
    var trollAttackSound: AVAudioPlayer!
    var selectionScreenSound: AVAudioPlayer!
    
    //OUTLETS
    @IBOutlet weak var initialStackView: UIStackView!
    @IBOutlet weak var combatStackView: UIStackView!
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var player1nameLbl: UITextField!
    @IBOutlet weak var selectCharLbl: UILabel!
    @IBOutlet weak var player1SelectTrollImg: UIButton!
    @IBOutlet weak var player1SelectSoldierImg: UIButton!
    @IBOutlet weak var player2nameLbl: UITextField!
    @IBOutlet weak var selectChar2Lbl: UILabel!
    @IBOutlet weak var player2SelectTrollImg: UIButton!
    @IBOutlet weak var player2SelectSoldierImg: UIButton!
    @IBOutlet weak var groundImg: UIImageView!
    @IBOutlet weak var beginBtn: UIButton!
    @IBOutlet weak var player1AttLbl: UILabel!
    @IBOutlet weak var player2AttLbl: UILabel!
    @IBOutlet weak var player1AttBtn: UIButton!
    @IBOutlet weak var player2AttBtn: UIButton!
    @IBOutlet weak var player1HpLbl: UILabel!
    @IBOutlet weak var player2HpLbl: UILabel!
    @IBOutlet weak var player1Img: UIImageView!
    @IBOutlet weak var player2Img: UIImageView!
    @IBOutlet weak var textHolderLbl: UILabel!
    @IBOutlet weak var textHolderImg: UIImageView!
    @IBOutlet weak var restartBtn: UIButton!
    @IBOutlet weak var rematchBtn: UIButton!
    @IBOutlet weak var restartLbl: UILabel!
    @IBOutlet weak var rematchLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialStackView.hidden = false
        combatStackView.hidden = true
        beginBtn.hidden = true
        hideCombatStuffOutsideStackView(true)
        hideScreenStuffOutsideStackView(true)
        hideFinalSceneStuff(true)
        
        let pathSoldierDie = NSBundle.mainBundle().pathForResource("knight_die", ofType: "wav")
        let soldierDieSoundUrl = NSURL(fileURLWithPath: pathSoldierDie!)
        
        do {
            try soldierDieSound = AVAudioPlayer(contentsOfURL: soldierDieSoundUrl)
            soldierDieSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        let pathSoldierAttack = NSBundle.mainBundle().pathForResource("knight.scream", ofType: "wav")
        let soldierAttackSoundUrl = NSURL(fileURLWithPath: pathSoldierAttack!)
        
        do {
            try soldierAttackSound = AVAudioPlayer(contentsOfURL: soldierAttackSoundUrl)
            soldierAttackSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        let pathTrollDie = NSBundle.mainBundle().pathForResource("orc_die", ofType: "wav")
        let trollDieSoundUrl = NSURL(fileURLWithPath: pathTrollDie!)
        
        do {
            try trollDieSound = AVAudioPlayer(contentsOfURL: trollDieSoundUrl)
            trollDieSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        let pathTrollAttack = NSBundle.mainBundle().pathForResource("orc.scream", ofType: "wav")
        let trollAttackSoundUrl = NSURL(fileURLWithPath: pathTrollAttack!)
        
        do {
            try trollAttackSound = AVAudioPlayer(contentsOfURL: trollAttackSoundUrl)
            trollAttackSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        let pathSelectScreen = NSBundle.mainBundle().pathForResource("selection.screen.loop", ofType: "wav")
        let selectScreenSoundUrl = NSURL(fileURLWithPath: pathSelectScreen!)
        
        do {
            try selectionScreenSound = AVAudioPlayer(contentsOfURL: selectScreenSoundUrl)
            selectionScreenSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    //ACTIONS
    @IBAction func onPlayer1SelectSoldier(sender: AnyObject) {
        if !player1Ready {
            player1SelectTrollImg.hidden = true
            player1 = Soldier(name: "Player1")
            player1InitHp = player1.hp
            player1Ready = true
            player1Img.image = soldierLeftImg
            selectCharLbl.text = "READY TO FIGHT!"
            createPlayerImg()
        }
        if readyToBegin() {
            beginBtn.hidden = false
        }
        
    }
    
    @IBAction func onPlayer1SelectTroll(sender: AnyObject) {
        if !player1Ready {
            player1SelectSoldierImg.hidden = true
            player1 = Troll(name: "Player1")
            player1InitHp = player1.hp
            player1Ready = true
            player1Img.image = trollLeftImg
            selectCharLbl.text = "READY TO FIGHT!"
            createPlayerImg()
        }
        
        if readyToBegin() {
            beginBtn.hidden = false
        }
    }
    
    @IBAction func onPlayer2SelectSoldier(sender: AnyObject) {
        if !player2Ready {
            player2SelectTrollImg.hidden = true
            player2 = Soldier(name: "Player2")
            player2InitHp = player2.hp
            player2Ready = true
            player2Img.image = soldierRightImg
            selectChar2Lbl.text = "READY TO FIGHT!"
            createPlayerImg()
        }
        
        if readyToBegin() {
            beginBtn.hidden = false
        }
    }
    
    @IBAction func onPlayer2SelectTroll(sender: AnyObject) {
        if !player2Ready {
            player2SelectSoldierImg.hidden = true
            player2 = Troll(name: "Player2")
            player2InitHp = player2.hp
            player2Ready = true
            player2Img.image = trollRightImg
            selectChar2Lbl.text = "READY TO FIGHT!"
            createPlayerImg()
        }
        
        if readyToBegin() {
            beginBtn.hidden = false
        }
    }
    
    @IBAction func onBeginPressed(sender: AnyObject) {
        
        initialStackView.hidden = true
        combatStackView.hidden = false
 
        hideCombatStuffOutsideStackView(false)
        hideScreenStuffOutsideStackView(false)
        
        if player1nameLbl.text != "" {
            player1.name = player1nameLbl.text!
        }
        
        if player2nameLbl.text != "" {
            player2.name = player2nameLbl.text!
        }
        
        player1HpLbl.text = "\(player1.name). \(player1.hp) HP"
        player2HpLbl.text = "\(player2.name). \(player2.hp) HP"
    }
    
    @IBAction func onP1attackPressed(sender: AnyObject) {
        player1.attackPwr = player1.getRandomAttackPwr()
        player2.isAttacked(player1.attackPwr)
        if player2.isAlive() && player2.type == "Soldier" && player2.immunity >= player1.attackPwr {
            player2HpLbl.text = "\(player2.name). \(player2.hp) HP"
            textHolderLbl.text = "\(player1.name) attack was too soft! \(player2.name) gained +1 HP!"
        } else if player2.isAlive() {
            player2HpLbl.text = "\(player2.name). \(player2.hp) HP"
            textHolderLbl.text = "\(player2.name) was attacked for \(player1.attackPwr) HP!"
        } else {
            textHolderLbl.text = "\(player1.name) killed \(player2.name). Victoryyyy!!!"
            combatStackView.hidden = true
            hideCombatStuffOutsideStackView(true)
            hideFinalSceneStuff(false)
        }
    }
    
    @IBAction func onP2attackPressed(sender: AnyObject) {
        player2.attackPwr = player2.getRandomAttackPwr()
        player1.isAttacked(player2.attackPwr)
        if player1.isAlive() && player1.type == "Soldier" && player1.immunity >= player2.attackPwr {
            player1HpLbl.text = "\(player1.name). \(player1.hp) HP"
            textHolderLbl.text = "\(player2.name) attack was too soft! \(player1.name) gained +1 HP!"
        } else if player1.isAlive() {
            player1HpLbl.text = "\(player1.name). \(player1.hp) HP"
            textHolderLbl.text = "\(player1.name) was attacked for \(player2.attackPwr) HP!"
        } else {
            textHolderLbl.text = "\(player2.name) killed \(player1.name). Victoryyyy!!!"
            combatStackView.hidden = true
            hideCombatStuffOutsideStackView(true)
            hideFinalSceneStuff(false)
        }
    }
    
    @IBAction func onRestartBtnPressed(sender: AnyObject) {
        initialStackView.hidden = false
        combatStackView.hidden = true
        beginBtn.hidden = true
        hideCombatStuffOutsideStackView(true)
        hideScreenStuffOutsideStackView(true)
        hideFinalSceneStuff(true)
        
        player1Ready = false
        player2Ready = false
        
        player1SelectSoldierImg.hidden = false
        player1SelectTrollImg.hidden = false
        player2SelectSoldierImg.hidden = false
        player2SelectTrollImg.hidden = false
        selectCharLbl.text = "Select your character"
        selectChar2Lbl.text = "Select your character"
        player1nameLbl.text = ""
        player2nameLbl.text = ""
    }
    
    @IBAction func onRematchBtnPressed(sender: AnyObject) {
        hideFinalSceneStuff(true)
        player1.hp = player1InitHp
        player2.hp = player2InitHp
        player1HpLbl.text = "\(player1.name). \(player1.hp) HP"
        player2HpLbl.text = "\(player2.name). \(player2.hp) HP"
        textHolderLbl.text = ""
        combatStackView.hidden = false
        hideCombatStuffOutsideStackView(false)
    }
    
    //METHODS
    func hideFinalSceneStuff(myBoolean: Bool) {
        restartLbl.hidden = myBoolean
        restartBtn.hidden = myBoolean
        rematchBtn.hidden = myBoolean
        rematchLbl.hidden = myBoolean
    }
    
    func hideCombatStuffOutsideStackView(myBoolean: Bool) {
        player1AttLbl.hidden = myBoolean
        player2AttLbl.hidden = myBoolean
    }
    
    func hideScreenStuffOutsideStackView(myBoolean: Bool) {
        groundImg.hidden = myBoolean
        textHolderImg.hidden = myBoolean
        textHolderLbl.hidden = myBoolean
    }
    
    func createPlayerImg() {
        if player1Ready && player1.type == "Soldier" {
            player1Img.image = soldierLeftImg
        } else if player1Ready && player1.type == "Troll" {
            player1Img.image = trollLeftImg
        }
        
        if player2Ready && player2.type == "Soldier" {
            player2Img.image = soldierRightImg
        } else if player2Ready && player2.type == "Troll" {
            player2Img.image = trollRightImg
        }
    }
    
    func cena(){
    }
    
    func readyToBegin() -> Bool {
        if player1Ready && player2Ready {
            return true
        } else {
            return false
        }
    }
    
    func playSoldierDieSound() {
        if soldierDieSound.playing {
            soldierDieSound.stop()
        }
        soldierDieSound.play()
    }
    
    func playSoldierAttackSound() {
        if soldierAttackSound.playing {
            soldierAttackSound.stop()
        }
        soldierAttackSound.play()
    }
    
    func playTrollDieSound() {
        if trollDieSound.playing {
            trollDieSound.stop()
        }
        trollDieSound.play()
    }
    
    func playTrollAttackSound() {
        if trollAttackSound.playing {
            trollAttackSound.stop()
        }
        trollAttackSound.play()
    }
    
    func playSelectionScreenSound() {
        if selectionScreenSound.playing {
            selectionScreenSound.stop()
        }
        selectionScreenSound.play()
    }

}

