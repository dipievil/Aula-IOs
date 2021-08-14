//
//  ContentView.swift
//  App3B
//
//  Created by IOS SENAC on 14/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var texto = ""
    @State private var mostrarAlerta = false
    @State var idade = 0
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10){
            HStack(alignment: .center, spacing: 10){
                Text("Valor")
                
                TextField("Digite o valor", text: $texto).border(Color.red)
                	
            }.foregroundColor(.gray)
            
            
            
            HStack(alignment: .center, spacing: 10){
                Text("Idade: ")
                
                Stepper(value: $idade, in: 0...120){
                    Text("\(self.idade) anos")
                }
            }
            
            Quadradinhos()
            
            Button(action: {
                mostrarAlerta = true
                print("Print mostrou alerta")
            }){
                Text("Diga oi")
                    .padding(.horizontal, 20.0)
                    .padding(.vertical, 10)
            }
            
            Quadradinhos()
            
            Text("VStack").font(.footnote)
        }
        .padding([.top, .leading, .bottom], 20.0)
        .alert(isPresented: $mostrarAlerta){ () -> Alert in
            return Alert(title: Text("Olá"),
                         message: Text("Olá \(texto)"),
                         dismissButton: .default(Text("OK"))
            )}
    }
}


struct Quadradinhos : View{
    var body: some View{
        ZStack(alignment: .center, content: {
            Text("-----------")
        }).foregroundColor(Color.orange)
        .background(Color.white)
        .padding(10)
        .border(Color.gray,width:10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
