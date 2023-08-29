//
//  ResultListView.swift
//  Clicker
//
//  Created by Clément Lopez on 29/08/2023.
//

import SwiftUI

struct GameResultListView: View {
    let resultList:[GameResult]
    var body: some View {
        List(resultList){
        (result:GameResult) in
            Text("\(result.playerName) - \(result.score)")
        }
    }
}

struct ResultListView_Previews: PreviewProvider {
    static var previews: some View {
        GameResultListView(resultList:[
            GameResult(playerName: "Sheldon", score: 23),
            GameResult(playerName: "Leonard", score: 34),
            GameResult(playerName: "Marty", score: 12),
            GameResult(playerName: "Doc", score: 65),
            GameResult(playerName: "Jean", score: 42),
        ])
    }
}
