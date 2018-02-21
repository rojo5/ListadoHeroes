//
//  anadirHeroes.swift
//  Heroes
//
//  Created by CETYS on 21/2/18.
//  Copyright © 2018 CETYS. All rights reserved.
//

import UIKit
import CoreData

class anadirHeroes: UIViewController {
    
    @IBOutlet var heroe: UITextField!
    
    @IBOutlet var nombre: UITextField!
    
    
    @IBOutlet var descripcion: UITextField!
    
    @IBOutlet var latitud: UITextField!
    
    @IBOutlet var longitud: UITextField!
    
    
    @IBAction func cancelar(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func guardar(_ sender: UIBarButtonItem) {
        let _heroe = self.heroe.text
        let _nombre = self.nombre.text
        let _descripcion = self.descripcion.text
        let _latitud = Double(self.latitud.text!)
        let _longitud = Double(self.longitud.text!)
        
        guard let AppDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        
        let managedContext = AppDelegate.persistentContainer.viewContext
        
        let entidad = NSEntityDescription.entity(forEntityName: "Heroes", in: managedContext)
        
        let registro = NSManagedObject(entity: entidad!, insertInto: managedContext)
        
        registro.setValue(_heroe, forKey: "heroe")
        registro.setValue(_nombre, forKey: "nombre")
        registro.setValue(_descripcion, forKey: "descripcion")
        registro.setValue(_latitud, forKey: "latitud")
        registro.setValue(_longitud, forKey: "longitud")
        
        do{
            try managedContext.save()
            print("heroe guardar")
        } catch let error as NSError{
            print(print("No se ha podido leer \(error), \(error.userInfo)")
)
        }
        
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
