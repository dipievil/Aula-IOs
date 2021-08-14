import UIKit

var str = "Hello, playground"

//Funções

func ola(nome: String, sobrenome: String) -> String{
    return "Olá \(nome) \(sobrenome)"
}

ola(nome: "Diego",sobrenome:"Ritzel")

func getPI() -> Double{
    return 3.14
}

print( getPI())

//Classe

class Produto{
    var nome: String
    var preco: Double
    
    init(nome: String, preco: Double){
        self.nome = nome
        self.preco = preco
    }

    func imprimir() {
        print("Nome: \(self.nome)\nPreço: \(self.preco)")
    }

}

var p = Produto(nome:   "Pepsi", preco: 3.99)
p.imprimir()

var x = 5;

//Laços
while x > 0{
    print(x)
    x -= 1
}

repeat{
    print(x)
    x += 1
}while x<3

x = 2

//Switch
switch x {
case 1,2:
    print("Não é 3")
case 3:
    print("É 3")
default:
    print ("É outro")
}

//Matriz
let numeros = [1,2,3,4,5]

var pares = [Int]()

for i in 0..<numeros.count {
    if numeros[i] % 2 == 0{
        pares.append(numeros[i])
    }
}

print(pares)


//funcional
let numeros2 = [1,2,3,4].filter{
    (numero) -> Bool in
    if(numero % 2 == 0){
        return true
    }else{
        return false
    }
}

print(numeros2)


//Variável vazia
func funcaoNil() -> String?{
    return nil
}

let valorOpcional: String! = funcaoNil()
let valorOpcional2: String! = "foo"

let opcional2: String? = Optional.some(valorOpcional2)
let opcional3: String? = Optional.none
let opcional4: String? = valorOpcional

print(opcional2 == nil)
print(opcional3 == nil)
print(opcional4 == nil)

//Dictionary
var prod = Dictionary<String, Double>()
prod = ["café": 8.99, "Coca-cola":5.98]
print (prod)
print (prod["café"]!)
//prod.removeValue(forKey: "café")
print(prod)

print("--------")

for(name, price) in prod {
    print("\(name): \(price)")
}

//Struct
struct Person{
    var nome: String?
    var altura: Double
    
    init(nome: String, altura: Double){
        self.nome = nome
        self.altura = altura
    }
    
    func getDados() -> String?{
        return "\(self.nome!) - \(self.altura)"
    }
}

var persona = Person(nome: "Diego", altura: 1.8)
