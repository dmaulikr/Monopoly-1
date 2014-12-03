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
   
    override init() {
        super.init()
        // CDE8D0
        let boardPicture = SKSpriteNode(imageNamed: "monopoly-board")
        boardPicture.size = CGSize(width: 768, height: 768)
        addChild(boardPicture)
        boardPicture.position = CGPoint(x: boardPicture.size.width/2, y: boardPicture.size.height/1.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
