//
//  ContentView.swift
//  7mo intento de hacer el examen
//
//  Created by CCDM03 on 25/11/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    let coreDM: Persistencia
    @State var prodArray = [Empleados]()
    @State var seleccionado :Empleados?
    @State var id = ""
    @State var nombre = ""
    @State var domicilio = ""
    @State var puesto = ""
    @State var telefono = ""
    @State var activoOpc = ""
    var body: some View {
        
        VStack{
            NavigationView{
                
                    
                List{
                    ForEach(prodArray, id: \.self){
                        emp in
                        VStack{
                            Text("\(Int16(emp.id))")
                            Text(emp.nombre ?? " ")
                            Text(emp.domicilio ?? " ")
                            Text(emp.puesto ?? " ")
                            Text("\(emp.telefono)")
                            Text(emp.activoOpc ?? "")
                        }.onTapGesture{
                            seleccionado = emp
                            nombre = emp.nombre ?? " "
                            domicilio = emp.domicilio ?? " "
                            puesto = emp.puesto ?? " "
                            activoOpc = emp.activoOpc ?? ""
                        }
                        
                    }
                }.toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: Formulario(coreDM: Persistencia(), id: " ", nombre: " ", domicilio: " ", puesto: "", telefono: " ", activoOpc: "", vacio: " ")){
                            Text("Nuevo empleado")
                        }
                    }
                }
                Spacer()
            }
            .padding()
                Text("Selecciona un empleado")
        }.padding()
            .onAppear(perform: {mostrarEmp()})
        
        }
    func mostrarEmp(){
        prodArray = coreDM.listaCompletaEmp()
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM:Persistencia())
    }
}
