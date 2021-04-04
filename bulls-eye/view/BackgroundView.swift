//
//  BackgroundView.swift
//  bulls-eye
//
//  Created by Arshfod Captano on 03/04/2021.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack{
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding(40.0)
        .background(Color("BackgroundColor"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct TopView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack{
            Button(action: {
                game.restart()
            }){
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            Button(action: {
                // TODO
            }){
                RoundedImageViewFilled(systemName: "list.dash")
            }
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        
        VStack(spacing: 5.0) {
            LabelText(text: title.uppercased())
            RoundRectTextView(value: text)
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack{
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
