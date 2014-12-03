//
//  MainScene.swift
//  Monopoly
//
//  Created by Tillson on 12/3/14.
//  Copyright (c) 2014 Tillson Galloway. All rights reserved.
//

import UIKit
import SpriteKit

class MainScene: SKScene {
   
    let monopolyBoardNode = BoardNode()

    override func didMoveToView(view: SKView) {
        addChild(monopolyBoardNode)
        monopolyBoardNode.position = CGPoint(x: 0, y: 0)
    }
    
}
