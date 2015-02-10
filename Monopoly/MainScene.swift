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
    var game: MonopolyGame! = nil
    
    override func didMoveToView(view: SKView) {
        
        game = MonopolyGame(delegate: self)
        
        backgroundColor = SKColor(red: 205, green: 232, blue: 208, alpha: 1)
        addChild(monopolyBoardNode)
        monopolyBoardNode.position = CGPoint(x: 0, y: 0)
        
        let bundle = NSBundle.mainBundle()
        let path = bundle.pathForResource("properties", ofType: "json")
        var error: NSError?
        var data: NSData = NSData(contentsOfFile: path!)!
        let json: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error:&error)!
            if let objects = json as? [AnyObject] {
                for obj in objects {
                    var category = Category.Special
                    switch (obj["Group"] as String!) {
                        case "Brown": category = .Brown
                        case "LightBlue": category = .LightBlue
                        case "Pink": category = .Pink
                        case "Orange": category = .Orange
                        case "Red": category = .Red
                        case "Yellow": category = .Yellow
                        case "Green": category = .Green
                        case "Blue": category = .Blue
                        default: category = .Special
                    }
                    let name = (obj["Name"] as String)
                    let price = (obj["Price"] as Int)
                    let tile = (obj["Position"] as Int)
                    var rent = 0
                    if let r = obj["Rent"] as? Int {
                        rent = r
                    }

                    let property = Property(name: name, category: category, price: price, tile: tile, rent: rent)
                    game.tiles.append(property)
                }
            }
        
        game.players.append(Player(name: "Tillson"))
        game.players.append(Player(name: "Cameron"))
        game.players.append(Player(name: "Brian"))
        game.startGame()
    }
}

extension MainScene: MonopolyDelegate {
    func playerLandedOnProperty(player: Player, property: Property) {
//        println("\(player.name): landed on \(property.name).")
    }
}
