//
//  ContentView.swift
//  Clicker
//
//  Created by Clément Lopez on 21/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State var gameIsInProgress = false
    @State var score = 0
    @State var resultList:[GameResult] = []
    @AppStorage("nickName") var nickName = "Sheldon"
    @AppStorage("bestScore") var bestScore = 0
    @AppStorage("bestScoreName") var bestScoreName = ""
    var body: some View {
        VStack {
            EditableTextView(title: "Pseudo", editedText: $nickName)
                .padding()
            HStack {
                if score >= bestScore && score != 0 {
                    Image(systemName: "flame")
                }
                Text("Score : \(score)")
                    .padding()
            }.font(.title)
            
            if bestScoreName != "" {
                HStack{
                    Image(systemName: "star")
                    Text("\(bestScoreName) - \(bestScore)")
                    Image(systemName: "star")
                }
            }
            
           GameResultListView(resultList: resultList)

            if gameIsInProgress == true {
                Image(systemName: "plus.square")
                    .font(.title)
                    .onTapGesture {
                        userTouchClick()
                    }
            }
            Spacer()
            if gameIsInProgress == false {
                Button("Nouvelle partie"){
                  userTouchedStartButton()
                }
                .padding()
                
            }
        }
    }
    
    func userTouchedStartButton(){
        score = 0
        gameIsInProgress = true
        Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { (_) in
          gameDidFinish()
        }
    }
    
    func userTouchClick(){
        score += 1
    }
    
    func gameDidFinish(){
        gameIsInProgress = false
        if score > bestScore {
            bestScore = score
            bestScoreName = nickName
        }
        let result = GameResult(playerName: nickName, score: score)
        resultList.append(result)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
