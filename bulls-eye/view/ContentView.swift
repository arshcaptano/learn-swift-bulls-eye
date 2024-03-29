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
                        .transition(.scale)
                }else{
                    HitMeButton(game: $game, sliderValue: $sliderValue, isAlertVisible: $isAlertVisible)
                        .transition(.scale)
                }
            }
            
            if !isAlertVisible {
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
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
            withAnimation{
                isAlertVisible = true
            }
            
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
        .cornerRadius(Constants.General.roundedRectCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
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
