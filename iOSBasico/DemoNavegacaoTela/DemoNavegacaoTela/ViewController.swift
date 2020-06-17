//
//  ViewController.swift
//  DemoNavegacaoTela
//
//  Created by Douglas Frari on 16/06/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

class Tela1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("ViewController::viewDidLoad")
        
    }
    
    override func didReceiveMemoryWarning() {
        print("ViewController::didReceiveMemoryWarning")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("ViewController::viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("ViewController::viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("ViewController::viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("ViewController::viewDidDisappear")
    }
    @IBAction func chamarTela2Versao2(_ sender: Any) {
        performSegue(withIdentifier: "irTela2", sender: nil)
    }
    
    
}

