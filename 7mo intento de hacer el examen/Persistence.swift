//
//  Persistence.swift
//  7mo intento de hacer el examen
//
//  Created by CCDM03 on 25/11/22.
//

import CoreData

struct Persistencia {
    static let shared = Persistencia()
    
    let EmpC : NSPersistentContainer
        
        init(){
            EmpC = NSPersistentContainer(name: "Persistence")
            EmpC.loadPersistentStores(completionHandler: {
                (descripcion, error) in
                if let error = error {
                    fatalError("Core data failed to iniciar \(error.localizedDescription)")
                }
            })
        }
        
    func guardarEmp(id: String, nombre:String, domicilio: String, puesto: String, telefono: String, activoOpc: String){
            let empleado = Empleados(context: EmpC.viewContext)
            empleado.id = Int16(id) ?? 0
            empleado.nombre = nombre
            empleado.domicilio = domicilio
            empleado.puesto = puesto
            empleado.telefono = Int16(telefono) ?? 0
            empleado.activoOpc = activoOpc
            
            do{
                try EmpC.viewContext.save()
                print("se guardo")
            }catch{
                print("fallo")
            }
        }
        
        func listaCompletaEmp() -> [Empleados]{
            let fetchR : NSFetchRequest<Empleados> = Empleados.fetchRequest()
            
            do{
                return try EmpC.viewContext.fetch(fetchR)
            }
            catch{
                return []
            }
        }
        
        func listaEmp(codigo:String) -> Empleados?{
            let fetchR : NSFetchRequest<Empleados> = Empleados.fetchRequest()
            let predicate = NSPredicate(format: "codigo = %@", codigo)
            fetchR.predicate = predicate
            
            do{
                let datos = try EmpC.viewContext.fetch(fetchR)
                return datos.first
            }
            catch{
                print("dio error en \(error)")
            }
            return nil
        }
        
        func borrarEmp(empleado: Empleados){
            EmpC.viewContext.delete(empleado)
            
            do{
                try EmpC.viewContext.save()
            }
            catch{
                EmpC.viewContext.rollback()
                print("fallo a la conexion \(error.localizedDescription)")
            }
        }
        
        func actualizarEmp(empleado: Empleados){
            let fetchR : NSFetchRequest<Empleados> = Empleados.fetchRequest()
            let predicate = NSPredicate(format: "id = %@", empleado.id )
            fetchR.predicate = predicate
            
            
            do{
                let datos = try EmpC.viewContext.fetch(fetchR)
                let e = datos.first
                e?.nombre = empleado.nombre
                e?.puesto = empleado.puesto
                try EmpC.viewContext.save()
                print("se guardo")
            }
            catch{
                print("dio error en \(error)")
            }
            
            
            
        }

}
