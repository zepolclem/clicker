//
//  GameResult.swift
//  Clicker
//
//  Created by Clément Lopez on 29/08/2023.
//

import Foundation

struct GameResult : Identifiable {
    let id = UUID()
    let playerName:String
    let score:Int
}
