//
//  Actualizar.swift
//  7mo intento de hacer el examen
//
//  Created by CCDM03 on 25/11/22.
//

import SwiftUI

struct Actualizar: View{
    @State var coreDM: Persistencia
    @State var id: String
    @State var nombre: String 
    @State var domicilio: String
    @State var puesto: String
    @State var telefono: String
    @State var activoOpc: String
    var body: some View{
        HStack{
            VStack{
                TextField("ID del empleado", text: $id)
                    .keyboardType(.numberPad).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Nombre empleado", text: $nombre).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Domicilio empleado", text: $domicilio).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Puesto empleado", text: $puesto).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Telefono del empleado", text: $telefono)
                    .keyboardType(.numberPad).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("ActivoOPC", text: $activoOpc).textFieldStyle(RoundedBorderTextFieldStyle())
                NavigationView{
                    Button("Actualizar") {
                        coreDM.actualizarEmp(id: Int16(id) ?? 0, nombre: nombre, domicilio: domicilio, puesto: puesto, telefono: telefono, activoOpc: activoOpc)
                        }
                        
                    }
            }/*.onAppear(perform: {
                id = seleccionado?.id ?? 0
                nombre = seleccionado?.nombre ?? "kasjdhkjsad"
                domicilio = seleccionado?.domicilio ?? " kudfahks"
                puesto = seleccionado?.puesto ?? " ffdsf"
                telefono = String(seleccionado?.telefono ?? 0)
                activoOpc = seleccionado?.activoOpc ?? " sadfdaff"
            })*/
                Spacer()
            }
            Spacer()
        }
}
struct ContentView_Previews3: PreviewProvider {
    static var previews: some View {
        Actualizar(coreDM: Persistencia(), id: "", nombre: "", domicilio: "", puesto: " ", telefono: " ", activoOpc: " ")
    }
}
