//
//  ContentView.swift
//  RBBullsEye
//
//  Created by Quoc Nguyen on 2020/05/16.
//  Copyright © 2020 Quoc Nguyen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    
    @State var rGuess: Double = 0.5
    @State var gGuess: Double = 0.5
    @State var bGuess: Double = 0.5
    
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Color(red: rTarget, green: gTarget, blue: bTarget)
                    Text("Match this color")
                }
                VStack {
                    Color(red: rGuess, green: gGuess, blue: bGuess)
                     Text("R: \(Int(rGuess * 255.0))"
                        + " G: \(Int(gGuess * 255.0))"
                        + " B: \(Int(bGuess * 255.0))")
                }
            }
            Button(action: {
                self.showAlert = true
            }) {
                Text("Hit Me!")
            }.alert(isPresented: $showAlert) { () -> Alert in
                Alert(title: Text("Your Score"),
                message: Text(String(computeScore())))
            }.padding()
            ColorSlider(value: $rGuess, textColor: .red)
            ColorSlider(value: $gGuess, textColor: .green)
            ColorSlider(value: $bGuess, textColor: .blue)
        }
    }
    
    func computeScore() -> Int {
        let rDiff = rGuess - rTarget
        let gDiff = gGuess - gTarget
        let bDiff = bGuess - bTarget
        let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
        return Int((1.0 - diff) * 100.0 + 0.5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(textColor)
            Slider(value: $value).accentColor(textColor)
            Text("255").foregroundColor(textColor)
        }.padding(.horizontal)
    }
}
