//
//  TablaDinamicaTableViewController.swift
//  Heroes
//
//  Created by CETYS on 14/2/18.
//  Copyright © 2018 CETYS. All rights reserved.
//

import UIKit

class TablaDinamicaTableViewController: UITableViewController {
    
    var rutaAlArchivoPlist : String!
    
    var listadoHeroesEnArray: [[String]]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rutaAlArchivoPlist = Bundle.main.path(forResource: "ListaHeroes", ofType: "plist")
        
        listadoHeroesEnArray = NSArray (contentsOfFile: rutaAlArchivoPlist!) as! [[String]]

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1 // Ponemos 1 para indicar que no hay secciones
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listadoHeroesEnArray.count // Indica el numero de filas
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Personajes", for: indexPath)

        // Configure the cell...

        
        cell.textLabel!.text = listadoHeroesEnArray[indexPath.row][0]
        cell.detailTextLabel!.text = listadoHeroesEnArray[indexPath.row][1]

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "vistaDetallada" {
           
            
            let nombreArchivo = listadoHeroesEnArray[tableView.indexPathForSelectedRow!.row][0]
            let nombreHeroeReal = listadoHeroesEnArray[tableView.indexPathForSelectedRow!.row][1]
            let descripcionDelHeroe = listadoHeroesEnArray[tableView.indexPathForSelectedRow!.row][5]
            
            let pantallaDestino:ViewController = segue.destination as! ViewController
            
            pantallaDestino.nombreHeroe = nombreArchivo
            pantallaDestino.nombre = nombreHeroeReal
            pantallaDestino.descripcionHeroe = descripcionDelHeroe
        }
    }
    

}
