import SwiftUI

struct ContentView: View {
    
    @State var mostrarModal = false
    @State var mostrarTelaCheia = false
    
    var body: some View {
                
        TabView{
            ZStack{
                Color.orange
                VStack{
                   Text("Biblioteca Online").fontWeight(.bold).font(.system(size: 64.0))
                    Text("The books is on the table").font(.system(size:24))
                }
            }
            
            NavigationView{
               
                List{
                    Section(header: Text("Gestão de Livros")){
                        NavigationLink("Cadastro", destination: CadastraLivrosView())
                        NavigationLink("Listagem", destination: ListaLivrosView())
                    }
                    Section(header: Text("Configurações")){
                        Button("Sobre..."){
                            mostrarModal.toggle()
                        }.sheet(isPresented: $mostrarModal){
                            NavigationView{
                                ZStack{
                                    Color
                                        .orange
                                        .navigationBarTitle("Sobre")
                                    
                                    HStack{
                                        Text("Desenvolvido pela Orange 2020(c)").padding(10)
                                    }
                                }
                                
                            }
                        }
                    }
                }.navigationBarTitle("Biblioteca Online", displayMode: .inline)
                .padding(.top,60)
            }.navigationViewStyle(StackNavigationViewStyle())
            
        }.padding(.all, 10)
        .tabViewStyle(PageTabViewStyle())
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
                    NavigationLink( "\(livro.nomeLivro ?? " -- ") " , destination: EditaLivroView(livro: livro) )
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

struct EditaLivroView: View {
    
    var livro: Livro
    
    @State var txtNomeLivro = ""
    @State var txtAutorLivro = ""
    @State var txtAnoLivro = ""
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    // enviroment construído para permitir fechar a View
    @Environment(\.presentationMode) var presentation
    
    var body: some View{
        VStack{
            TextField("Digite o nome do Livro", text: $txtNomeLivro )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onAppear(){
                    self.txtNomeLivro = self.livro.nomeLivro ?? "erro"
                }
            
            TextField("Digite o nome do Autor", text: $txtAutorLivro )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onAppear(){
                    self.txtAutorLivro = self.livro.autorLivro ?? "erro"
                }
            
            TextField("Digite o Ano do Livro",	 text: $txtAnoLivro )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onAppear(){
                    self.txtAnoLivro = self.livro.anoLivro ?? "erro"
                }
                Button("Salvar Livro"){
                    livro.nomeLivro? =  txtNomeLivro
                    livro.autorLivro? =  txtAutorLivro
                    livro.anoLivro? =  txtAnoLivro
                    livro.managedObjectContext?.refresh(livro, mergeChanges: true)
                    PersistenceController.banco.save()
                    self.txtNomeLivro = ""
                    self.txtAutorLivro = ""
                    self.txtAnoLivro = ""
                    presentation.wrappedValue.dismiss()
                }
        }.padding()
        .navigationBarTitle("Editar Livro", displayMode: .inline)
    }
}

struct CadastraLivrosView: View {
    
    @State var txtNomeLivro = ""
    @State var txtAutorLivro = ""
    @State var txtAnoLivro = ""
    
    let actualYear = Calendar.current.component(.year, from: Date())
    let arYears = GetYearsList
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    // enviroment construído para permitir fechar a View
    @Environment(\.presentationMode) var presentation
    
    @FetchRequest(
        entity: Livro.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Livro.nomeLivro, ascending: true)])
    var livros: FetchedResults<Livro>
            
    
    var body: some View{
        VStack{
            VStack(alignment: .leading){
                                                                
                Text("Nome do livro")
                TextField("Digite o nome do livro", text: $txtNomeLivro )
                Text("Nome do autor")
                TextField("Digite o nome do autor", text: $txtAutorLivro )
                Text("Ano do Livro")
                TextField("Digite o ano de lançamento", text: $txtAnoLivro )
                    
                .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Adicionar livro"){
                    let livro = Livro(context: managedObjectContext)
                    livro.nomeLivro = self.txtNomeLivro
                    livro.autorLivro = self.txtAutorLivro
                    livro.anoLivro = String(self.txtAnoLivro)
                    PersistenceController.banco.save()
                    self.txtNomeLivro = ""
                    self.presentation.wrappedValue.dismiss()
                }
            }
        }.padding()
        .navigationBarTitle("Cadastro de Livros", displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func GetYearsList(){
    var yearsTillNow : [String] {
        var years = [String]()
        let actualYear = Calendar.current.component(.year, from: Date())
        for i in (1970..<actualYear).reversed() {
            years.append("\(i)")
        }
        return years
    }
}

