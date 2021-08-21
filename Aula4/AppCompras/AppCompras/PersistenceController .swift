//
//  PersistenceController .swift
//  AppCompras
//
//  Created by IOS SENAC on 21/08/21.
//

import CoreData

struct PersistenceController{
    
    static let banco = PersistenceController()
    
    let container : NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores{ (descricao, erro) in
            if let erro = erro {
                fatalError("Erro: \(erro.localizedDescription)")
            }
        }
    }
    
    func save(completion: @escaping (Error?) -> () = {_ in 	}){

        let context = container.viewContext

        if context.hasChanges{
            do{
                try context.save()
                completion(nil)
            } catch{
                completion (error)
            }
        }
    }
    
    func delete(_ object: NSManagedObject,completion: @escaping (Error?) -> () = {_ in }){
        let context = container.viewContext
        
        context.delete(object)
        save(completion: completion)        
    }
    
}
