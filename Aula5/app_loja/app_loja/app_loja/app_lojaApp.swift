//
//  app_lojaApp.swift
//  app_loja
//
//  Created by IOS SENAC on 04/09/21.
//

import SwiftUI

@main
struct app_lojaApp: App {
    
    let persistenceController = PersistenceController.banco
        
    // Enviroment construído para tratar cada cenário da aplicação (Ex: quando fica em background)
    @Environment( \.scenePhase ) var scenePhase
        
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        // tratando para quando o APP muda de cenário
        .onChange(of: scenePhase) { (newScenePhase) in
                    switch newScenePhase {
                    case .background:
                        persistenceController.save()
                        print("Está em background")
                    case .inactive:
                        print("Está inativo")
                    case .active:
                        print("Está ativo")
                    @unknown default:
                        print("Default")
 
                    }
        }
    }
}
