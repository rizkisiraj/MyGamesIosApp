//
//  MyGamesApp.swift
//  MyGames
//
//  Created by Rizki Siraj on 01/06/24.
//

import SwiftUI

@main
struct MyGamesApp: App {
    
    @StateObject private var manager: DataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
                .environment(\.managedObjectContext, manager.container.viewContext)
        }
    }
}
