//
//  Tela3ViewController.swift
//  DemoNavigationControll
//
//  Created by Douglas Frari on 17/06/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

class Tela3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    

    @IBAction func fechar(_ sender: Any) {
        // o dismiss é usado quando só temos navegação usando SEGUE
        // dismiss(animated: true, completion: nil)
        
        navigationController?.popViewController(animated: true)
        
    }
    

}
