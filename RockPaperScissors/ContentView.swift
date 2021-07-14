//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by YunShou Chao on 7/14/21.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    let possibleMoves: [String] = ["Rock", "Paper", "Scissors"]
    
    @State private var appsMove: Int = Int.random(in: 0...2)
    @State private var shouldWin: Bool = Bool.random()
    @State private var playersMove: Int = 0
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = ""
    @State private var playerWin: Bool = true
    @State private var playerLoose: Bool = true
    @State private var score: Int = 0
    @State private var round: Int = 0
    
    var winOrLoose: String {
        if shouldWin {
            return "Win"
        } else {
            return "Loose"
        }
    }
    
    var body: some View {
        VStack {
            Text("Opponent:")
            Text("\(possibleMoves[appsMove])")
                .foregroundColor(.orange)
                .font(.largeTitle)
                .padding()
            Text("You should")
            Text("\(winOrLoose)")
                .foregroundColor(shouldWin ? .red : .green)
                .font(.largeTitle)
                .padding()
            Spacer()
            HStack {
                Button {
                    playersMove = 0
                    checkCorrectness(of: playersMove)
                    showAlert = true
                } label: {
                    Text("Rock")
                }
                Button {
                    playersMove = 1
                    checkCorrectness(of: playersMove)
                    showAlert = true
                } label: {
                    Text("Paper")
                }
                Button {
                    playersMove = 2
                    checkCorrectness(of: playersMove)
                    showAlert = true
                } label: {
                    Text("Scissors")
                }
            }
            Spacer()
        }
        .alert(isPresented: $showAlert, content: {
            // TODO: Add dismiss button for the 10th round to reset everything
            Alert(title: Text("\(alertTitle)"), message: Text("Your score is \(score)"), dismissButton: .default(Text("OK")) {
                newMove()
            })
        })
    }
    
    private func checkCorrectness(of playersMove: Int) {
        playerWin = (playersMove - appsMove + 3) % 3 == 1
        playerLoose = (appsMove - playersMove + 3) % 3 == 1
        if (playerWin && shouldWin) || (playerLoose && !shouldWin) {
            alertTitle = "Correct"
            score += 1
        } else {
            alertTitle = "Wrong"
        }
    }
    
    private func newMove() {
        appsMove = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
