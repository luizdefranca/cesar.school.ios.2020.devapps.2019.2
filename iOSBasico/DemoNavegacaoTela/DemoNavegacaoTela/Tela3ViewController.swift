//
//  Tela3ViewController.swift
//  DemoNavegacaoTela
//
//  Created by Douglas Frari on 16/06/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

class Tela3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("Tela3ViewController::viewDidLoad")
    }
    
    override func didReceiveMemoryWarning() {
        print("Tela3ViewController::didReceiveMemoryWarning")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Tela3ViewController::viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Tela3ViewController::viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Tela3ViewController::viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Tela3ViewController::viewDidDisappear")
    }

    @IBAction func fecharTela(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
