//
//  ContentView.swift
//  7mo intento de hacer el examen
//
//  Created by CCDM03 on 17/11/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    let coreDM: Persistencia
    @State var prodArray = [Empleados]()
    var body: some View {
        NavigationView {
            List{
                ForEach(prodArray, id: \.self){
                    emp in
                    VStack{
                        
                    }
                    
                }
            }
            Spacer()
        }
        .padding()
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: Formulario(coreDM: Persistencia(), id: " ", nombre: " ", domicilio: " ", puesto: "", telefono: " ", activoOpc: "", vacio: " ")){
                        Text("Nuevo empleado")
                    }
                }
            }
            Text("Select an item")
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM:Persistencia())
    }
}



