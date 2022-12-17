//
//  Devote_SwiftUIApp.swift
//  Devote_SwiftUI
//
//  Created by Venkata Ajay Sai (Paras) on 21/09/22.
//

import SwiftUI

@main
struct Devote_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    @AppStorage("isDarkMode") private var isDarkMode:Bool = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            // managedObjectContext key in the environment is designed to store our active core data managed object context.
            // With the above single line of code, the managed object context is injected for the core data container in the whole SwiftUI app hierarchy, and its all child views.
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
