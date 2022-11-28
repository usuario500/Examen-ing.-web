//
//  Actualizar.swift
//  7mo intento de hacer el examen
//
//  Created by CCDM03 on 25/11/22.
//

import SwiftUI

struct Actualizar: View{
    @State var coreDM: Persistencia
    @State var id = ""
    @State var nombre = ""
    @State var domicilio = ""
    @State var puesto = ""
    @State var telefono = ""
    @State var activoOpc = ""
    @State var vacio = ""
    
    var body: some View{
        
        HStack{
            VStack{
                TextField("ID empleado", text: $id)
                    .keyboardType(.numberPad).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Nombre empleado", text: $nombre).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Domicilio empleado", text: $domicilio).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Puesto empleado", text: $puesto).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Telefono del empleado", text: $telefono)
                    .keyboardType(.numberPad).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("ActivoOPC", text: $activoOpc).textFieldStyle(RoundedBorderTextFieldStyle())
                NavigationView{
                    Button("Guardar") {
                        coreDM.guardarEmp(id: id, nombre: nombre, domicilio: domicilio, puesto: puesto, telefono: telefono, activoOpc: activoOpc)
                        }
                        
                    }
                }
                Spacer()
            }
            Spacer()
        }
}
struct ContentView_Previews3: PreviewProvider {
    static var previews: some View {
        Actualizar(coreDM: Persistencia(), id: " ", nombre: " ", domicilio: " ", puesto: "", telefono: " ", activoOpc: "", vacio: " ")
    }
}
