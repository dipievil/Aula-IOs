//
//  ContentView.swift
//  Aula3Tarefa
//
//  Created by IOS SENAC on 14/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var nome = ""
    @State private var email = ""
    @State private var usuario = ""
    @State private var aceitaNewsletter = false
    @State private var jogoPreferido = 1
    @State private var mostrarAlerta = false
    @State var idade = 0

    var body: some View {

        VStack(alignment: .leading){
                        
            HStack(alignment: .center, spacing: 0){
                Text("Formulário de Cadastro")
                    .font(.title)
                    .padding(10)
            }.padding(.bottom, 10.0)
            
            HStack(alignment: .center ,  spacing: 1){
                Text("Nome")
                
                TextField("Digite o seu nome", text: $nome).border(Color.red)
            }.padding(.bottom, 10.0)
                       
            HStack (alignment: .center){
                Text("E-mail")
                
                TextField("Digite o seu e-mail", text: $email).border(Color.red)
            }
            .padding(.bottom, 10.0)

            HStack(alignment: .center, spacing: 10){
                Text("Usuário da Steam")
                
                TextField("Somente o seu usário", text: $usuario).border(Color.red)
                    
            }.padding(.bottom, 10.0)

            HStack(alignment: .center){
                              
                Picker(selection: $jogoPreferido, label: Text("Estilo de jogo preferido")) {
                    Text("MOBA").tag(1)
                    Text("FPS").tag(2)
                    Text("RTS").tag(3)
                    Text("Plataforma").tag(4)
                    Text("FPS").tag(5)
                    Text("Outro").tag(6)
                }
                    
            }.foregroundColor(.gray)
            
            HStack(alignment: .center){
                Toggle(isOn: $aceitaNewsletter, label: {
                    Text("Assinar Newslleter?")
                }).padding(40)
            }

            Button(action: {
                mostrarAlerta = true
                print("Button press")
            }){
                Text("Cadastrar-se")
                    .padding(.horizontal, 20.0)
                    .padding(.vertical, 10)
            }
            
        }.padding(30)
        .alert(isPresented: $mostrarAlerta){ () -> Alert in
            return Alert(title: Text("Cadastro enviado"),
                         message: Text("Seu cadstro foi enviado com sucesso!"),
                         dismissButton: .default(Text("Uhuul"))
            )}
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
