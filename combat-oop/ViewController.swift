//
//  ViewController.swift
//  combat-oop
//
//  Created by Amadeu Andrade on 13/04/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var trool: Troll!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        trool = Troll(name: "TR00L")
        print("Troll attack is \(trool.attackPwr) and HP is \(trool.hp)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    

}

