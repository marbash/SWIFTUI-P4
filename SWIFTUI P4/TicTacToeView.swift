//
//  XOGameView.swift
//  SWIFTUI P4
//
//  Created by MOHD ALARBASH on 5/8/20.
//  Copyright © 2020 MOHD ALARBASH. All rights reserved.
//

import SwiftUI

struct Fields {
    var text: String
    var enabled: Bool
}

struct TicTacToeView: View {
    @State var fields: [[Fields]] = .init(repeating: .init(repeating: Fields(text: "",enabled: true), count: 3), count: 3)
    @State var currentPlayer: String = "X"
    @State var winner: String = ""
    @State var counter: Int = 0
    
    func checkWinners() {
        func checkWinner(p: String)
        {
            let r1 = fields[0][0].text == p && fields[0][1].text == p && fields[0][2].text == p
            let r2 = fields[1][0].text == p && fields[1][1].text == p && fields[1][2].text == p
            let r3 = fields[2][0].text == p && fields[2][1].text == p && fields[2][2].text == p
            
            let c1 = fields[0][0].text == p && fields[1][0].text == p && fields[2][0].text == p
            let c2 = fields[0][1].text == p && fields[1][1].text == p && fields[2][1].text == p
            let c3 = fields[0][2].text == p && fields[1][2].text == p && fields[2][2].text == p
            
            let d1 = fields[0][0].text == p && fields[1][1].text == p && fields[2][2].text == p
            let d2 = fields[0][2].text == p && fields[1][1].text == p && fields[2][0].text == p
            
            if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2
            {
                winner = "\(p) Wins!!"
                
//                ForEach(0..<3) { r in
//                    ForEach(0..<3) { c in
//
//                        self.fields[r][c].enabled = false
//
//                    }
                    
//                }
                
            }
            else if self.counter == 9
            {
                winner = "DRAW !!"
            }
            
            
            
        }
        
        checkWinner(p: "X")
        checkWinner(p: "O")
    }
    
    func restartGame()
    {
        
        fields = .init(repeating: .init(repeating: Fields(text: "",enabled: true), count: 3), count: 3)
        currentPlayer = "X"
        winner = ""
        counter = 0
        
    }
    
    var body: some View {
        
        
        VStack (spacing: 10){
            Text(winner)
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .foregroundColor(.red)
            Text("\(currentPlayer) Turn")
                .font(.system(size: 50, weight: .bold, design: .rounded))
            
            ForEach(0..<3) { r in
                HStack(spacing: 10){
                    ForEach(0..<3) { c in
                        Button(action: {
                            // when tapping change the current button either to X or O
                            if self.fields[r][c].enabled
                            {
                                self.fields[r][c].text = self.currentPlayer
                                self.currentPlayer = self.currentPlayer == "X" ? "O" : "X"
                                self.fields[r][c].enabled = false
                                self.counter += 1
                                self.checkWinners()
                                
                            }
                        }) {
                            //
                            Text(self.fields[r][c].text)
                                .foregroundColor(.white)
                                .font(.system(size:50 , weight: .bold, design: .rounded))
                                .frame(width: 100, height: 100,alignment: .center)
                                .background(Color.blue)
                            
                        }
                    }
                }
                
            }
            Button(action: {
                //code
                self.restartGame()
            }) {
                if winner != ""
                {
                    Text("Restart Game")
                        .font(.system(size:30,weight:.bold,design:.rounded))
                }
            }
        }
    }
}

struct TicTacToeView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeView()
    }
}
