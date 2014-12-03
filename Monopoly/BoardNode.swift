//
//  BoardNode.swift
//  Monopoly
//
//  Created by Tillson on 12/3/14.
//  Copyright (c) 2014 Tillson Galloway. All rights reserved.
//

import UIKit
import SpriteKit

class BoardNode: SKNode {
   
    let board = SKSpriteNode(imageNamed: "monopoly-board")
    
    override init() {
        super.init()
        board.size = CGSize(width: 768, height: 768)
        addChild(board)
        board.position = CGPoint(x: 0, y: board.size.height/6)
        board.anchorPoint = CGPoint(x: 0, y: 0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
