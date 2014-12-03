//
//  MonopolyGame.swift
//  Monopoly
//
//  Created by Tillson on 12/3/14.
//  Copyright (c) 2014 Tillson Galloway. All rights reserved.
//

class MonopolyGame {
    var players: [Player] = []
    var tiles: [Property] = []
    
    func rollDice() {
        
    }
    
    func checkForLosers() {
        for player in players {
            if (player.money <= 0) {
                println("\(player.name) lost!")
            }
        }
    }
    
    func getPropertyForTile(tile: Int) -> Property? {
        return tiles.filter{ $0.tile == tile }[0]
    }
}

class Player {
    let name: String
    
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


