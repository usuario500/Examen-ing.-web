//
//  Formulario.swift
//  7mo intento de hacer el examen
//
//  Created by CCDM03 on 17/11/22.
//

import SwiftUI

struct Formulario: View{
    let coreMD: PersistenceController
    @State var id = 0
    @State var nombre = ""
    @State var domicilio = ""
    @State var puesto = ""
    @State var telefono = 0
    @State var activoOpc = ""
    @State var vacio = ""
    @State var seleccionado :Empleados?
    
    var body: some View{
        HStack{
            Spacer()
            VStack{
                Spacer()
                TextField("ID empleado", text: $vacio)
                    .keyboardType(.numberPad).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Nombre empleado", text: $nombre).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Domicilio empleado", text: $domicilio).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Puesto empleado", text: $puesto).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Telefono del empleado", text: $vacio)
                    .keyboardType(.numberPad).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("ActivoOPC", text: $activoOpc).textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Save") {
                    if( seleccionado != nil){
                        
                        seleccionado?.precio = precio
                        seleccionado?.codigo = codigo
                        seleccionado?.nombre = nombre
                        coreDM.AP(producto: seleccionado!)
                    }
                    else{
                    coreDM.GP(codigo: codigo, nombre: nombre, precio: precio)
                    }
                    nombre = ""
                    codigo = " "
                    precio = " "
                    seleccionado = nil
                }
                Spacer()
            }
            Spacer()
        }
    }
}


