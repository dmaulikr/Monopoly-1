//
//  MonopolyGame.swift
//  Monopoly
//
//  Created by Tillson on 12/3/14.
//  Copyright (c) 2014 Tillson Galloway. All rights reserved.
//

import UIKit

class MonopolyGame {
    var players = [Player]()
    var tiles = [Property]()
    let delegate: MonopolyDelegate
    
    init(delegate: MonopolyDelegate) {
        self.delegate = delegate
    }
    
    func startGame() {
        println("Lets go!")
        rollDice(players[0])
    }
    
    func rollDice(player: Player) {
        let number = arc4random_uniform(6) + 2
        for i in 0...number {
            player.tile += 1
            if player.tile > tiles.count - 1 {
                player.tile = 1
                player.money += 200
            }
        }
        
        if let property = getPropertyForTile(player.tile) {
            delegate.playerLandedOnProperty(player, property: property)
        } else {
            println("ERROR: Tile \(player.tile) not found.")
        }
        
        checkForLosers()
        let index = (players as NSArray).indexOfObject(player)
        if (index == players.count - 1) {
            rollDice(players[0])
        } else {
            rollDice(players[index + 1])
        }
    }
    
    func checkForLosers() {
        for player in players {
            if (player.money <= 0) {
                println("\(player.name) lost!")
            }
        }
    }
    
    func getPropertyForTile(tile: Int) -> Property? {
        let matches = tiles.filter{ $0.tile == tile }
        if matches.count > 0 {
            return matches[0]
        }
        return nil
    }
}

class Player {
    let name: String
    var tile = 0
    
    var money = 1500
    
    init(name: String) {
        self.name = name
    }
}

class House {
    
}

class Hotel: House {
    
}

class Property {
    let name: String
    let category: Category
    let price: Int
    let tile: Int
    let rent: Int
    let houses = [House]()
    var owner: Player?
    
    init(name: String, category: Category, price: Int, tile: Int, rent: Int) {
        self.name = name
        self.category = category
        self.price = price
        self.tile = tile
        self.rent = rent
    }
}

enum Category {
    case Brown, LightBlue, Pink, Orange, Red, Yellow, Green, Blue, Special
    
    func getCategory(name: String) -> Category {
        switch name {
        case "Brown": return .Brown
        case "LightBlue": return .LightBlue
        case "Pink": return .Pink
        case "Orange": return .Orange
        case "Red": return .Red
        case "Yellow": return .Yellow
        case "Green": return .Green
        case "Blue": return .Blue
        default: return .Special
        }
    }

}


