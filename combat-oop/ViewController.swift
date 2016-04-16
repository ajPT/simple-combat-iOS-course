//
//  ViewController.swift
//  combat-oop
//
//  Created by Amadeu Andrade on 13/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var player1: Character!
    var player2: Character!
    var player1Ready = false
    var player2Ready = false
    
    var trollRightImg: UIImage = UIImage(named: "enemy-right")!
    var trollLeftImg: UIImage = UIImage(named: "enemy-left")!
    var soldierRightImg: UIImage = UIImage(named: "player-right")!
    var soldierLeftImg: UIImage = UIImage(named: "player-left")!
    
    @IBOutlet weak var logoImg: UIImageView! //begin screen
    @IBOutlet weak var player1nameLbl: UITextField! //begin screen
    @IBOutlet weak var selectCharLbl: UILabel! //begin screen
    @IBOutlet weak var player1SelectTrollImg: UIButton! //begin screen
    @IBOutlet weak var player1SelectSoldierImg: UIButton! //begin screen
    @IBOutlet weak var player2nameLbl: UITextField! //begin screen
    @IBOutlet weak var selectChar2Lbl: UILabel! //begin screen
    @IBOutlet weak var player2SelectTrollImg: UIButton! //begin screen
    @IBOutlet weak var player2SelectSoldierImg: UIButton! //begin screen
    @IBOutlet weak var groundImg: UIImageView!
    @IBOutlet weak var textHolderLbl: UIImageView!
    @IBOutlet weak var beginBtn: UIButton! //begin screen
    @IBOutlet weak var player1AttLbl: UILabel!
    @IBOutlet weak var player2AttLbl: UILabel!
    @IBOutlet weak var player1AttBtn: UIButton!
    @IBOutlet weak var player2AttBtn: UIButton!
    @IBOutlet weak var player1HpLbl: UILabel!
    @IBOutlet weak var player2HpLbl: UILabel!
    @IBOutlet weak var player1Img: UIImageView!
    @IBOutlet weak var player2Img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideInitialScreen(false)
        beginBtn.hidden = true
        hideCombatScreen(true)
    }
    
    @IBAction func onPlayer1SelectSoldier(sender: AnyObject) {
        if !player1Ready {
            player1SelectTrollImg.hidden = true
            player1 = Soldier(name: "Player1")
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
        if player1nameLbl.text != "" {
            player1.name = player1nameLbl.text!
        }
        
        if player2nameLbl.text != "" {
            player2.name = player2nameLbl.text!
        }
        
        hideInitialScreen(true)
        hideCombatScreen(false)
        player1HpLbl.text = "\(player1.name). \(player1.hp) HP"
        player2HpLbl.text = "\(player2.name). \(player2.hp) HP"
    }
    
    
    @IBAction func onP1attackPressed(sender: AnyObject) {
    }
    
    @IBAction func onP2attackPressed(sender: AnyObject) {
    }
    
    func hideInitialScreen(myBoolean: Bool) {
        beginBtn.hidden = myBoolean
        logoImg.hidden = myBoolean
        player1nameLbl!.hidden = myBoolean
        selectCharLbl.hidden = myBoolean
        player1SelectTrollImg.hidden = myBoolean
        player1SelectSoldierImg.hidden = myBoolean
        player2nameLbl!.hidden = myBoolean
        selectChar2Lbl.hidden = myBoolean
        player2SelectTrollImg.hidden = myBoolean
        player2SelectSoldierImg.hidden = myBoolean
    }
    
    func hideCombatScreen(myBoolean: Bool) {
        groundImg.hidden = myBoolean
        textHolderLbl.hidden = myBoolean
        player1Img.hidden = myBoolean
        player2Img.hidden = myBoolean
        player1HpLbl.hidden = myBoolean
        player2HpLbl.hidden = myBoolean
        player1AttBtn.hidden = myBoolean
        player2AttBtn.hidden = myBoolean
        player1AttLbl.hidden = myBoolean
        player2AttLbl.hidden = myBoolean
        player1AttBtn.hidden = myBoolean
        player2AttBtn.hidden = myBoolean
        player1Img.hidden = myBoolean
        player2Img.hidden = myBoolean
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
    
    
    func readyToBegin() -> Bool {
        if player1Ready && player2Ready {
            return true
        } else {
            return false
        }
    }
    

}

