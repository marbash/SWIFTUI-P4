//
//  KhatmaView.swift
//  SWIFTUI P4
//
//  Created by MOHD ALARBASH on 5/7/20.
//  Copyright © 2020 MOHD ALARBASH. All rights reserved.
// Day 4 - Classwork 10

import SwiftUI

struct KhatmaView: View {
    @State var counter = 0
    
    func plural5atma(_ counter: Int) -> (String, String)
    {
        switch counter{
        case 1: return ("ختمة واحدة", "")
        case 2: return ("ختمتان", "")
        case 3...10: return ("ختمات", "\(counter)")
        default: return("ختمة", "\(counter)")
        }
    }

    
    var body: some View {
                ZStack {
            RamadanBG()
                    VStack{
           Text("ستحتاج إلى" + " \(counter * 20) " + "عدداً من الصفحات تقرأها يومياً")

                .font(.title)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
                
                        Stepper("كم ختمة تريد أن تختم في هذا الشهر؟ ", value: $counter, in: 1...100)
                                .foregroundColor(.white)
                                .padding()
                        HStack{
                               Text(plural5atma(counter).0)
                                   .foregroundColor(.white)
                                   .padding()
                                   .font(.largeTitle)
                                Text(plural5atma(counter).1)
                                    .foregroundColor(.white)
                                    .padding()
                                    .font(.largeTitle)
                        }


            }
        }
    }
}

struct RamadanBG: View {
    var body: some View {
        ZStack {
            Image("BACKGROUND")
                .resizable()
            VStack{
                
                Image("Header")
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                Spacer()
                Image("Mosque")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct KhatmaView_Previews: PreviewProvider {
    static var previews: some View {
        KhatmaView()
    }
}
