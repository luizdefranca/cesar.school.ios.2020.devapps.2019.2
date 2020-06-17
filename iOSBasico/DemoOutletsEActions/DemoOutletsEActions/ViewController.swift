//
//  ViewController.swift
//  DemoOutletsEActions
//
//  Created by Douglas Frari on 16/06/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 9 BOTOES , sendo que:
    // indice 0 = botao 1
    // indice 1 = botao 2
    // etc.
    @IBOutlet var numeros: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func digitouNumero(_ sender: Any) {
        
        if sender as? UIButton == numeros[0] {
            print("Numero 1 foi pressionado")
        } else if sender as? UIButton == numeros[1] {
            print("Numero 2 foi pressionado")
        }
        
        if let button = sender as? UIButton {
            print("Digitou o número? \(button.titleLabel?.text ?? "") ")
        }
        
        
        
    }
    
}

