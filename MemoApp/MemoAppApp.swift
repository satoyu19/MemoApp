//
//  MemoAppApp.swift
//  MemoApp
//
//  Created by cmStudent on 2022/05/03.
//

import SwiftUI

@main
struct MemoAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
