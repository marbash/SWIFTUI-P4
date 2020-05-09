//
//  XOGameView.swift
//  SWIFTUI P4
//
//  Created by MOHD ALARBASH on 5/8/20.
//  Copyright © 2020 MOHD ALARBASH. All rights reserved.
//

import SwiftUI
import AudioToolbox
import AVFoundation

var music: AVAudioPlayer!

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
                
                for i in 0..<3 {
                    for y in 0..<3 {
                        self.fields[i][y].enabled = false
                    }
                }
//                ForEach(0..<3) { r in
//                    ForEach(0..<3) { c in
//
//                        self.fields[r][c].enabled = false
//
//                    }
//
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
    
    func playMusic(play: Bool) {
        if let musicURL = Bundle.main.url(forResource: "PhantomFromSpace", withExtension: "mp3") {
            if let audioPlayer = try? AVAudioPlayer(contentsOf: musicURL) {
                music = audioPlayer
                music.numberOfLoops = 0
                if play == true{
                
                music.play()
                //
                } else {
                        music.stop()
                    }
                
                }
            }
        }
    
    @State var isPlaying: Bool = false
    var body: some View {
        
        ZStack {
        
            BG()
            
        
        VStack (spacing: 10){
            
            Button(action: {
                //Code
                self.isPlaying.toggle()
                self.playMusic(play: self.isPlaying)
                
            }) {
                Text(isPlaying ? "Stop Music":"Play Music")
                    .foregroundColor(.white)
            }
            
            Text(winner)
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            Text("\(currentPlayer) Turn")
                .font(.system(size: 50, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
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
                                AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) { }
                                
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
}

struct BG: View {
    var body: some View {
        VStack{
        Image("BG")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            //.frame(height: 50)
        Spacer()
        }.background(Color.black).edgesIgnoringSafeArea(.all)
    }
}

struct TicTacToeView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeView()
    }
}
