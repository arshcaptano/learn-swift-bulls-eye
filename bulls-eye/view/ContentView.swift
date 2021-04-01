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
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("🎯🎯🎯\nPut the Bullseye as close as you can to".uppercased())
                    .bold()
                    .kerning(2.0)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4.0)
                    .font(.footnote)
                    .foregroundColor(Color("TextColor"))
                Text(String(game.target))
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .foregroundColor(Color("TextColor"))
                    .kerning(-1.0)
                HStack {
                    Text("1")
                        .bold()
                        .foregroundColor(Color("TextColor"))
                    Slider(value: $sliderValue, in: 1.0...100.0)
                    Text("100")
                        .bold()
                        .foregroundColor(Color("TextColor"))
                }
                .padding()
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
