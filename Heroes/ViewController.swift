//
//  ViewController.swift
//  Heroes
//
//  Created by CETYS on 13/2/18.
//  Copyright © 2018 CETYS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var NombreArtistico: UILabel!
    
    var nombreHeroe :String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NombreArtistico.text = nombreHeroe
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

