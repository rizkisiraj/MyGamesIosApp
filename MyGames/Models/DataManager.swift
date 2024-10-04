//
//  DataManager.swift
//  MyGames
//
//  Created by Rizki Siraj on 04/10/24.
//

import CoreData
import Foundation

class DataManager: NSObject, ObservableObject {
    
    let container: NSPersistentContainer = NSPersistentContainer(name: "GameDataModel")
    
    override init() {
        super.init()
        container.loadPersistentStores { _, _ in }
    }
}
