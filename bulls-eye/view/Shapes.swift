//
//  Shapes.swift
//  bulls-eye
//
//  Created by Arshfod Captano on 01/04/2021.
//

import SwiftUI

struct Shapes: View {
    
    @State private var wideShapes = true
    
    var body: some View {
        VStack{
            if !wideShapes{
            Circle()
                .strokeBorder(Color.blue, lineWidth: 20.0)
                .frame(width: 200, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                .transition(.scale)
            }
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/10.0/*@END_MENU_TOKEN@*/)
                .fill(Color.blue)
                .frame(width: wideShapes ? 200 : 100, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
            Capsule()
                .fill(Color.blue)
                .frame(width:  wideShapes ? 200 : 100, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
            Ellipse()
                .fill(Color.blue)
                .frame(width:  wideShapes ? 200 : 100, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
            
            Button(action: {
               
                withAnimation {
                    wideShapes.toggle()
                }
            }, label: {
                Text("Animate")
            })
        }
        .background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
