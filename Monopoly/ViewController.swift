//
//  ViewController.swift
//  Monopoly
//
//  Created by Tillson on 12/3/14.
//  Copyright (c) 2014 Tillson Galloway. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 205, green: 232, blue: 208, alpha: 1)

        let skView = SKView(frame: view.frame)
        skView.showsFPS = true
        view.addSubview(skView)
        
        let scene = MainScene(size: view.frame.size)
        skView.presentScene(scene)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        println("memory warning!")
    }


}

