//
//  Tela0ViewController.swift
//  DemoNavegacaoTela
//
//  Created by Douglas Frari on 16/06/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

class Tela0ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("Tela0ViewController::viewDidLoad")
    }
    
    override func didReceiveMemoryWarning() {
        print("Tela0ViewController::didReceiveMemoryWarning")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Tela0ViewController::viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Tela0ViewController::viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Tela0ViewController::viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Tela0ViewController::viewDidDisappear")
    }
    
    @IBAction func tela2(_ sender: Any) {
        // a forma de disparar a SEGUE manualmente
        performSegue(withIdentifier: "irTela2", sender: nil)
    }
    
    @IBAction func unwindTela1(_ sender: UIStoryboardSegue) {
        print("Voltou para tela 1")
    }
    
    
} // fim da classe
