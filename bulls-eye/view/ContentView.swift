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
        ZStack{
            BackgroundView(game: $game)
            VStack {
                InstructionView(game: $game)
                    .padding(.bottom, isAlertVisible ? 0 : 100.0)
                
                if isAlertVisible {
                    PointsView(game: $game, sliderValue: $sliderValue, isAlertVisible: $isAlertVisible)
                }else{
                    HitMeButton(game: $game, sliderValue: $sliderValue, isAlertVisible: $isAlertVisible)
                }
            }
            
            if !isAlertVisible {
            SliderView(sliderValue: $sliderValue)
            }
        }
    }
}


struct InstructionView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack{
            InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
        .padding()
    }
}

struct HitMeButton: View {
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var isAlertVisible: Bool
    
    var body: some View {
        Button(action: {
            isAlertVisible = true
        }) {
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]),
                               startPoint: .top,
                               endPoint: .bottom)
            }
        )
        .foregroundColor(.white)
        .cornerRadius(21.0)
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white, lineWidth: 2.0)
        )
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
