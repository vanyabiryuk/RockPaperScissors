//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Vanüsha on 06.06.2022.
//

import SwiftUI

struct ContentView: View {
    let options = ["🪨 Rock", "📄 Paper", "✂️ Scissors"]
    
    @State private var choice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    
    @State private var tries = 0
    @State private var showingResult = false
    
    var body: some View {
        ZStack {
            LinearGradient(stops: [.init(color: .blue, location: 0.10),
                                   .init(color: .black, location: 0.65)], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack {
                Text("Score: \(score)")
                    .font(.title3)
                    .foregroundColor(.white)
                    
                Spacer()
                VStack(spacing: 5) {
                    Text("My next move will be \(options[choice]),")
                        .foregroundColor(.white)
                    Text("and you shoud \(shouldWin ? "win" : "lose").")
                        .foregroundColor(shouldWin ? .green : .red)
                        .fontWeight(.semibold)
                }
                .font(.title2)
                
                Spacer()
                
                VStack(spacing: 10) {
                    ButtonView(title: "🪨 Choose Rock") {
                        optionSelected(0)
                    }
                    ButtonView(title: "📄 Choose Paper") {
                        optionSelected(1)
                    }
                    ButtonView(title: "✂️ Choose Scissors") {
                        optionSelected(2)
                    }
                }
            }
            .padding()
        }
        .alert("The Game is Over!", isPresented: $showingResult) {
            Button("Close") {
                tries = 0
                score = 0
            }
        } message: {
            Text("You managed to get \(score) points!")
        }
    }
    
    func isWinnig(option1: Int, option2: Int) -> Bool {
        switch option1 {
        case 0:
            if option2 == 1 { return false }
        case 1:
            if option2 == 2 { return false }
        case 2:
            if option2 == 0 { return false }
        default:
            break
        }
        
        return true
    }
    
    func optionSelected(_ option: Int) {
        
        if option != choice {
            let userIsWinning = isWinnig(option1: option, option2: choice)
            if userIsWinning == shouldWin { score += 1 }
            else { score -= 1 }
        }
        
        tries += 1
        if tries == 10 { showingResult = true }
        
        choice = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
