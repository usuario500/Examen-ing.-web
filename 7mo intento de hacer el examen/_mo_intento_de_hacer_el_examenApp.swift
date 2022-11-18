//
//  _mo_intento_de_hacer_el_examenApp.swift
//  7mo intento de hacer el examen
//
//  Created by CCDM03 on 17/11/22.
//

import SwiftUI

@main
struct _mo_intento_de_hacer_el_examenApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
