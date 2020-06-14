//
//  ContentView.swift
//  BullsEye
//
//  Created by Quoc Nguyen on 2020/05/17.
//  Copyright © 2020 Quoc Nguyen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let target = Int.random(in: 1..<100)
    @State private var guess: Double = 0.5
    @State private var showAlert: Bool = false
    
    var body: some View {
        VStack {
            Text("Put the Bull's Eye as close as you can do: \(target)")
            HStack {
                Text("0")
                Slider(value: $guess).background(Color.blue.opacity(sliderOpacity()))
                Text("100")
            }.padding(.horizontal)
            Button(action: {
                self.showAlert = true
            }) {
                Text("Hit Me!")
            }.padding().alert(isPresented: $showAlert) { () -> Alert in
                Alert(title: Text("Your Score"), message: Text("\(score())"))
            }
            Spacer()
        }.padding(.vertical)
    }
    
    private func score() -> Int {
        let difference = abs(target - Int(100*guess))
        return 100 - difference
    }
    
    private func sliderOpacity() -> Double {
        return abs(Double(target) / 100 - guess)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
