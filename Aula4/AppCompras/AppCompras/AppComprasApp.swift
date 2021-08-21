//
//  AppComprasApp.swift
//  AppCompras
//
//  Created by IOS SENAC on 21/08/21.
//

import SwiftUI

@main
struct AppComprasApp: App {
    
    let persistenceController = PersistenceController.banco
    
    @Environment( \.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
        }.onChange(of: scenePhase){ (newScenePhase) in
            switch newScenePhase {
            case.background:
                persistenceController.save()
            case.inactive:
                print ("Está inativo")
            case.active:
                print ("Está Inativo")
            @unknown default:
                print("Default")
            }
            
        }
    }
}
