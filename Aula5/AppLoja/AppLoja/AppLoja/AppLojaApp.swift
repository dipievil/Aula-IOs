//
//  AppLojaApp.swift
//  AppLoja
//
//  Created by IOS SENAC on 04/09/21.
//

import SwiftUI

@main
struct AppLojaApp: App {
    
    let persistenceController = PersistenceController.banco
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
