//
//  ContentView.swift
//  7mo intento de hacer el examen
//
//  Created by CCDM03 on 17/11/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var empleados: FetchedResults<Empleados>

    var body: some View {
        NavigationView {
            List {
                ForEach(empleados) { empleados in
                    
                }
                //.onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    NavigationLink( destination: Formulario(coreDM: Persistencia){
                        Text("Nuevo empleado")
                    }
                }
            }
            Text("Select an item")
        }
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(empleados: <#FetchedResults<Empleados>#>)
    }
}
