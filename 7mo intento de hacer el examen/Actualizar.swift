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
    @State var prodArray = [Empleados]()
    var body: some View{
        HStack{
            VStack{
                TextField("Nombre empleado", text: $nombre).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Domicilio empleado", text: $domicilio).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Puesto empleado", text: $puesto).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Telefono del empleado", text: $telefono)
                    .keyboardType(.numberPad).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("ActivoOPC", text: $activoOpc).textFieldStyle(RoundedBorderTextFieldStyle())
                NavigationView{
                    Button("Actualizar") {
                        coreDM.actualizarEmp(id: id, nombre: nombre, domicilio: domicilio, puesto: puesto, telefono: telefono, activoOpc: activoOpc)
                       
                        id = " "
                        nombre = " "
                        domicilio = " "
                        puesto = " "
                        telefono = ""
                        activoOpc = " "
                        }
                        
                    }
            }.onAppear(perform: {
                mostrarEmp()
            })
                Spacer()
            }
            Spacer()
        }
    func mostrarEmp(){
        prodArray = coreDM.listaCompletaEmp()
    }
    
}
struct ContentView_Previews3: PreviewProvider {
    static var previews: some View {
        Actualizar(coreDM: Persistencia(), id: "", nombre: "", domicilio: "", puesto: " ", telefono: " ", activoOpc: " ")
    }
}
