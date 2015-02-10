//
//  MonopolyDelegate.swift
//  Monopoly
//
//  Created by Tillson on 2/9/15.
//  Copyright (c) 2015 Tillson Galloway. All rights reserved.
//

import UIKit

protocol MonopolyDelegate {
    func playerLandedOnProperty(player: Player, property: Property)
}
