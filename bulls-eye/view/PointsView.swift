//
//  PointsView.swift
//  bulls-eye
//
//  Created by Arshfod Captano on 07/04/2021.
//

import SwiftUI

struct PointsView: View {
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var isAlertVisible: Bool
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        
        VStack(spacing: 10.0){
            InstructionText(text: "The Slider's value is")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(points) points\n🎉🎉🎉")
            Button(action: {
                isAlertVisible = false
                game.startNewRound(points: points)
            }, label: {
                ButtonText(text: "Start New Round")
            })
           
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(21.0)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 5)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var isAlertVisible = Binding.constant(false)
    static private var sliderValue =  Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        PointsView(game: game, sliderValue: sliderValue, isAlertVisible: isAlertVisible)
        PointsView(game: game, sliderValue: sliderValue, isAlertVisible: isAlertVisible)
            .preferredColorScheme(.dark)
    }
}
