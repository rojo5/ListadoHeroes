//
//  ViewController.swift
//  Heroes
//
//  Created by CETYS on 13/2/18.
//  Copyright © 2018 CETYS. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var NombreArtistico: UILabel! //weak quitado
    @IBOutlet var nombreReal: UILabel!
    @IBOutlet var descripcion: UILabel!
    @IBOutlet var miMapa: MKMapView!
    
    var nombreHeroe :String = ""
    var nombre : String = ""
    var descripcionHeroe : String = ""
    var latitud : Double = 0
    var longitud : Double = 0
    
    @IBAction func cambiarModo(_ sender: UIBarButtonItem) {
        if (miMapa.mapType == MKMapType.standard){
            miMapa.mapType = MKMapType.satellite
            sender.title = "Normal"
        }else{
            miMapa.mapType = MKMapType.standard
            sender.title = "Satelite"
        }
    }
    
    @IBAction func localizar(_ sender: UIBarButtonItem) {
        
        let  coordenadasHeroes = CLLocationCoordinate2D (latitude: latitud, longitude: longitud)
        let miZoom: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegion(center: coordenadasHeroes, span: miZoom)
        miMapa.setRegion(region, animated: true)

        let miAnotacion = MKPointAnnotation()
        miAnotacion.coordinate = coordenadasHeroes
        miAnotacion.title = "Base"
        miAnotacion.subtitle =  nombreHeroe
        
        miMapa.addAnnotation(miAnotacion)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NombreArtistico.text = nombreHeroe
        nombreReal.text = nombre
        descripcion.text = descripcionHeroe
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

