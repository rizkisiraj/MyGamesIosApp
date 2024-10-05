import CoreData
import Foundation

class DataManager: NSObject, ObservableObject {
    
    let container: NSPersistentContainer = NSPersistentContainer(name: "GameDataModel")
    
    override init() {
        super.init()
        
        // Optionally delete the persistent store for development purposes
        deletePersistentStore()

        // Load persistent stores after deleting the previous one
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            } else {
                print("Persistent store loaded successfully")
            }
        }
    }
    
    // Function to delete the existing persistent store (SQLite files)
    func deletePersistentStore() {
        let fileManager = FileManager.default
        guard let storeURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("GameDataModel.sqlite") else {
            print("Could not find persistent store URL")
            return
        }

        let walURL = storeURL.appendingPathExtension("wal")
        let shmURL = storeURL.appendingPathExtension("shm")
        
        do {
            // Remove the SQLite file
            if fileManager.fileExists(atPath: storeURL.path) {
                try fileManager.removeItem(at: storeURL)
                print("Deleted SQLite file: \(storeURL.path)")
            }
            
            // Remove the WAL file
            if fileManager.fileExists(atPath: walURL.path) {
                try fileManager.removeItem(at: walURL)
                print("Deleted WAL file: \(walURL.path)")
            }
            
            // Remove the SHM file
            if fileManager.fileExists(atPath: shmURL.path) {
                try fileManager.removeItem(at: shmURL)
                print("Deleted SHM file: \(shmURL.path)")
            }
        } catch {
            print("Failed to delete persistent store: \(error)")
        }
    }
}
