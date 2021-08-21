//
//  ContentView.swift
//  AppAula04
//
//  Created by IOS SENAC on 21/08/21.
//

import SwiftUI

struct ContentView: View {
    	
    @State var txtNome = ""
    @State var listaProd = [ Produto(id: 0, nomeProd: "Sabão") ]
    @State var txtTexto = ""
    
    var body: some View {
        
        TabView{
            VStack{
                ScrollView{
                    ScrollViewReader{ reader in
                        ForEach(self.listaProd){ prod in
                            HStack{
                                Text(prod.nomeProd)
                                Spacer()
                            }
                            .padding()
                            .onAppear{
                                reader.scrollTo(self.listaProd.count - 1)
                            }
                        }
                    }
                }
                HStack{
                    TextField("Nome do produto", text: $txtNome).border(Color.black, width: 2).textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button ("Salvar"){
                        self.listaProd.append(Produto(id : self.listaProd.count, nomeProd: self.txtNome))
                        self.txtNome = ""
                    }
                }
                
                
            }.padding(10)
            
            Link(destination: URL(string: "https://www.apple.com")!, label: {
                Text("Clique aqui para abrir o site da Apple")
            })
            
            Text("Segunda Tela")
            
            Text("Terceira tela")
            
            TextEditor(text: $txtTexto)
        
        }.tabViewStyle(PageTabViewStyle())
    }
}

struct Produto: Identifiable{
    var id : Int
    var nomeProd : String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 
 //GRIDVIEW EXAMPLE
 
 let colunas = [
     GridItem(.flexible(), spacing: 5),
     GridItem(.flexible(), spacing: 5),
     GridItem(.flexible(), spacing: 5)
 ]
     
 var body: some View {
     ScrollView{
         LazyVGrid(columns: colunas) {
             ForEach(1...100,id: \.self){     i in
                 Text("Número: \(i)").padding(.all,5).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1).fixedSize()
             }
         }
     }
 }
 
 */
