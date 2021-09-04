import SwiftUI

struct ContentView: View {
    
    @State var mostrarModal = false
    @State var mostrarTelaCheia = false
    
    var body: some View {
                
        TabView{
            VStack{
                Text("Biblioteca Online").fontWeight(.bold).font(.system(size: 64.0))
                Text("The books is on the table").font(.system(size:24))
            }
                        
            NavigationView{
                List{
                    Section(header: Text("Listar")){
                        NavigationLink("Cadastro de Livros", destination: CadastraLivrosView())
                        NavigationLink("Listagem de livros", destination: ListaLivrosView())
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
                }.navigationBarTitle("Biblioteca Online", displayMode: .inline)
            }.navigationViewStyle(StackNavigationViewStyle())
            
        }.padding(.all, 10)
        .tabViewStyle(PageTabViewStyle())
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

struct ListaLivrosView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    // enviroment construído para permitir fechar a View
    @Environment(\.presentationMode) var presentation
    
    @FetchRequest(
        entity: Livro.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Livro.nomeLivro, ascending: true)])
    
    var livros: FetchedResults<Livro>
    
    var body: some View{
        VStack{
            List{
                ForEach( livros , id: \.self){ livro in
                    Text("\(livro.nomeLivro ?? " -- ") ")
                }
                .onDelete(perform: removerLivro)
            }
            
        }.padding()
        .navigationBarTitle("Lista de Livros", displayMode: .inline)
    }
    
    //Função para excluir Livros
    func removerLivro(at offset: IndexSet){
        for index in offset{
            let cli = livros[index]
            PersistenceController.banco.delete( cli )
        }
    }
}

struct CadastraLivrosView: View {
    
    @State var txtNomeLivro = ""
    @State var txtAutorLivro = ""
    @State var txtAnoLivro = ""
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    // enviroment construído para permitir fechar a View
    @Environment(\.presentationMode) var presentation
    
    @FetchRequest(
        entity: Livro.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Livro.nomeLivro, ascending: true)])
    var livros: FetchedResults<Livro>
    
    var body: some View{
        VStack{
            VStack{
                TextField("Nome do livro", text: $txtNomeLivro )
                TextField("Nome do autor", text: $txtAutorLivro )
                TextField("Ano do livro", text: $txtAnoLivro )
                    
                .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Adicionar livro"){
                    let livro = Livro(context: managedObjectContext)
                    livro.nomeLivro = self.txtNomeLivro
                    livro.autorLivro = self.txtAutorLivro
                    livro.anoLivro = self.txtAnoLivro
                    PersistenceController.banco.save()
                    self.txtNomeLivro = ""
                    self.presentation.wrappedValue.dismiss()
                }
            }
        }.padding()
        .navigationBarTitle("Cadastro de Livros", displayMode: .inline)
    }
}


struct ProdutosView: View {
    
    @State var txtNomeProduto = ""
    
    @Environment(\.managedObjectContext) var managedObjectContext
        /*
    @FetchRequest(
        entity: Produto.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Produto.nomeProd, ascending: true)])
    var produtos: FetchedResults<Produto>
    */
    var body: some View{
        VStack{
            /*
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
             */
        }.padding()
        .navigationBarTitle("Lista de Produtos", displayMode: .large)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
