//
//  ContentView.swift
//  bulls-eye
//
//  Created by Arshfod Captano on 30/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAlertVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO!")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4.0)
                .font(.footnote)
            
            Text(String(game.target))
                .fontWeight(.black)
                .font(.largeTitle)
                .kerning(-1.0)
            HStack {
                Text("1")
                    .bold()
                Slider(value: $sliderValue, in: 1.0...100.0)
                Text("100")
                    .bold()
            }
            Button(action: {
                isAlertVisible = true
            }) {
                Text("Hit me")
            }
            .alert(
                isPresented: $isAlertVisible,
                content: {
                    let roundedValue = Int(sliderValue.rounded())
                    return Alert(
                        title: Text("Hello"),
                        message: Text("The slider's value is \(roundedValue).\n" +
                                        "You scored \(game.points(sliderValue: roundedValue)) points in this round."),
                        dismissButton: .default(Text("Close")))
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
