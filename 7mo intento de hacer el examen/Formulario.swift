//
//  Formulario.swift
//  7mo intento de hacer el examen
//
//  Created by CCDM03 on 17/11/22.
//

import SwiftUI

struct Formulario: View{
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
            Spacer()
            VStack{
                Spacer()
                TextField("ID empleado", text: $id)
                    .keyboardType(.numberPad).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Nombre empleado", text: $nombre).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Domicilio empleado", text: $domicilio).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Puesto empleado", text: $puesto).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Telefono del empleado", text: $telefono)
                    .keyboardType(.numberPad).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("ActivoOPC", text: $activoOpc).textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Guardar") {
                        coreDM.guardarEmp(id: Int16(id) ?? 0, nombre: nombre, domicilio: domicilio, puesto: puesto, telefono: Int16(telefono) ?? 0, activoOpc: activoOpc)
                    }
                    
                }
                Spacer()
            }
            Spacer()
        }
}
struct ContentView_Previews2: PreviewProvider {
    static var previews: some View {
        Formulario(coreDM: Persistencia(), id: " ", nombre: " ", domicilio: " ", puesto: "", telefono: " ", activoOpc: "", vacio: " ")
    }
}


