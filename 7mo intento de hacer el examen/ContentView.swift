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

    var body: some View {
         
        VStack{
            NavigationView{
                
                    
                List{
                    ForEach(prodArray, id: \.self){
                        emp in
                        VStack{
                            Text(emp.id ?? " " )
                            Text(emp.nombre ?? " ")
                            Text(emp.domicilio ?? " ")
                            Text(emp.puesto ?? " ")
                            Text(emp.telefono ?? " " )
                            Text(emp.activoOpc ?? "")
                            NavigationLink(destination: Actualizar(coreDM: Persistencia(), id: emp.id ?? " " , nombre: String(emp.nombre ?? " "), domicilio: emp.domicilio ?? "", puesto: emp.puesto ?? "", telefono: emp.telefono ?? " " , activoOpc: emp.activoOpc ?? " " )){
                                Text("Actualizar")
                            }
                        }
                        
                    }.onDelete(perform: {
                        index in
                        index.forEach({
                            index in
                            let empleado = prodArray[index]
                            coreDM.borrarEmp(empleado: empleado)
                            mostrarEmp()
                        })
                    })
                    
                }.toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: Formulario(coreDM: Persistencia())){
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
