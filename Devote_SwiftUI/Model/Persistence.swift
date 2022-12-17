//
//  Persistence.swift
//  Devote_SwiftUI
//
//  Created by Venkata Ajay Sai (Paras) on 21/09/22.
//

import CoreData

struct PersistenceController {
    // MARK: - 1. PERSISTENT CONTROLLER
    static let shared = PersistenceController()

    // MARK: - 2. PERSISTENT CONTAINER - Storage property for core data.
    let container: NSPersistentContainer

    // MARK: - INITIALIZATION (load the persistent store)
    init(inMemory: Bool = false) {
        // MARK: - With this in memory conditional state we can access the non disc storage. Its perfect for unit testing and for using it in the SwiftUI Preview.
        container = NSPersistentContainer(name: "Devote_SwiftUI")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    // MARK: - PREVIEW
    static var preview: PersistenceController = {
        // MARK: - Using the in-memory store for providing sample data to the preview is totally optional but highly recommended.
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for i in 0..<5 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = "Sample task No\(i)"
            newItem.id = UUID()
            newItem.completion = false
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}
