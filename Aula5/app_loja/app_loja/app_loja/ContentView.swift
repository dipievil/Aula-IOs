//
//  ContentView.swift
//  AppLoja
//
//  Created by Adalto Selau Sparremberger on 04/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var mostrarModal = false
    @State var mostrarTelaCheia = false
        
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Listar")){
                    NavigationLink("Clientes", destination: ClientesView())
                    NavigationLink("Produtos", destination: ProdutosView())
                }
                Section(header: Text("Configurações")){
                    Button("Abrir Modal"){
                        mostrarModal.toggle()
                    }.sheet(isPresented: $mostrarModal){
                        NavigationView{
                            Color.red.navigationBarTitle("Tela do Modal", displayMode: .inline)
                        }
                    }
                    
                    if #available(iOS 14, *){
                        Button("Sobre"){
                            mostrarTelaCheia.toggle()
                        }.fullScreenCover(isPresented: $mostrarTelaCheia, content: {
                            TelaCheiaView(mostrarTela: $mostrarTelaCheia)
                        })
                    }
                }
            }.navigationBarTitle("AppLoja", displayMode: .inline)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TelaCheiaView: View {
    
    @Binding var mostrarTela: Bool
    
    var body: some View{
        ZStack{
            Color.yellow
            Button("Fechar"){
                mostrarTela.toggle()
            }
        }
    }
}


struct ClientesView: View {
    
    @State var txtNomeCliente = ""
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    // enviroment construído para permitir fechar a View
    @Environment(\.presentationMode) var presentation
    
    @FetchRequest(
        entity: Cliente.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Cliente.nomeCli, ascending: true)])
    var clientes: FetchedResults<Cliente>
    
    var body: some View{
        VStack{
            List{
                ForEach( clientes , id: \.self){ cli in
                    Text("\(cli.nomeCli ?? " -- ") ")
                }
                .onDelete(perform: removerCliente)
            }
            HStack{
                TextField("Digite o nome do cliente", text: $txtNomeCliente )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Salvar Cliente"){
                    let cliente = Cliente(context: managedObjectContext)
                    cliente.nomeCli = self.txtNomeCliente
                    PersistenceController.banco.save()
                    self.txtNomeCliente = ""
                    self.presentation.wrappedValue.dismiss()
                }
            }
        }.padding()
        .navigationBarTitle("Lista de Clientes", displayMode: .inline)
    }
    //Função para excluir Clientes
    func removerCliente(at offset: IndexSet){
        for index in offset{
            let cli = clientes[index]
            PersistenceController.banco.delete( cli )
        }
    }
}


struct ProdutosView: View {
    
    @State var txtNomeProduto = ""
    
    @Environment(\.managedObjectContext) var managedObjectContext
        
    @FetchRequest(
        entity: Produto.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Produto.nomeProd, ascending: true)])
    var produtos: FetchedResults<Produto>
    
    var body: some View{
        VStack{
            List{
                ForEach( produtos , id: \.self){ prod in
                    Text("\(prod.nomeProd ?? " -- ") ")
                }
                .onDelete(perform: removerProduto)
            }
            HStack{
                TextField("Digite o nome do produto", text: $txtNomeProduto )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Salvar Produto"){
                    let produto = Produto(context: managedObjectContext)
                    produto.nomeProd = self.txtNomeProduto
                    PersistenceController.banco.save()
                    self.txtNomeProduto = ""
                }
            }
        }.padding()
        .navigationBarTitle("Lista de Produtos", displayMode: .large)

    }
    
    //Função para excluir Produtos
    func removerProduto(at offset: IndexSet){
        for index in offset{
            let prod = produtos[index]
            PersistenceController.banco.delete( prod )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
