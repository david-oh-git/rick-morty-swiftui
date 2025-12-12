//
//  rick_and_morty_swiftuiApp.swift
//  rick and morty swiftui
//
//  Created by shinji on 7/20/24.
//

import SwiftUI
import SwiftData

@main
struct rick_and_morty_swiftuiApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            RickAndMortyView()
        }
    }
}
