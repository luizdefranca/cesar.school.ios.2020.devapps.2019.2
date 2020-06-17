//
//  Tela2ViewController.swift
//  DemoNavegacaoTela
//
//  Created by Douglas Frari on 16/06/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

class Tela2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("Tela2ViewController::viewDidLoad")
    }
    
    override func didReceiveMemoryWarning() {
        print("Tela2ViewController::didReceiveMemoryWarning")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Tela2ViewController::viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Tela2ViewController::viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Tela2ViewController::viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Tela2ViewController::viewDidDisappear")
    }

    @IBAction func fecharTela(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
