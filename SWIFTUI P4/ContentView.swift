//
//  ContentView.swift
//  SWIFTUI P4
//
//  Created by MOHD ALARBASH on 5/7/20.
//  Copyright © 2020 MOHD ALARBASH. All rights reserved.
// Day 4 - Class Work 9

import SwiftUI

struct ContentView: View {
    @State var weight: String = ""
    @State var height: String = ""
    
    @State var bmi: String = "0.0"
    @State var bmiStatus: String = "-"
    
    func calculateBmiAndUpdateView(){
        let weight = Double(self.weight)!
        let height = Double(self.height)!
        let bmi = calculateBmi(weight: weight, height: height)
        let bmiStatus = self.bmiStatus(bmi: bmi)
        self.bmi = String(format: "%.1f", bmi)
        self.bmiStatus = bmiStatus

    }
    
    func calculateBmi(weight: Double, height: Double) -> Double {
        return weight / (height*height)

    }
    func bmiStatus(bmi: Double) -> String {
        switch bmi{
        case ..<20:     return "ضعيف"
        case 20..<25:   return "جيد"
        case 25...:     return "سمين"
        default:        return "خطأ"
        }

    }

    var body: some View {
        VStack {
            Text("Welcome to BMI Calculator")
                .font(.title).bold()
            TextField("height in (m)", text: $height)
               
            TextField("weight in (kg)", text: $weight)
            
            Button(action: {
                // calculation ( Hi I am closure)
                self.calculateBmiAndUpdateView()
            }) {
                // View ( Hi I am closure too, but i return a view)
                Text("calculate")
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 40)
                    .background(Color.blue)
                    .clipShape(Capsule())
            }

            VStack {
                Text("BMI")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(bmi)
                    .font(.system(size: 70))
                    .fontWeight(.heavy)
                    .padding()
                Text("Status")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(bmiStatus)
                    .font(.system(size: 60))
                    .fontWeight(.heavy)
                    .padding()
            }
        }
        .padding(.all)
        
        


    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
