//
//  ContentView.swift
//  AppAula03
//
//  Created by IOS SENAC on 14/08/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack(alignment: .center, spacing: 20){
            
            Text("Hello, world!")
                .font(.caption)
                .foregroundColor(Color.blue)
                .padding(10)
            
            Text("E ae!\nWazzap")
                .foregroundColor(.red)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(10)
                            
            Button(action: {
                print("botão")
            }){
                Image("foto")
                    .resizable()
                    .frame(width: 320, height: 240, alignment: .center)
                    .clipped()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black,lineWidth: 5))
        }.padding(.horizontal, 20)
        .padding(/*@START_MENU_TOKEN@*/.vertical, 10.0/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
