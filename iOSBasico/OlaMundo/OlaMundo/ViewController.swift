//
//  ViewController.swift
//  OlaMundo
//
//  Created by Douglas Frari on 15/06/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTesteBotao2: UILabel!
    
    @IBOutlet weak var imageTeste: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("ViewController::viewDidLoad")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("ViewController::viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("ViewController::viewDidAppear")
    }


    @IBAction func testButtonAction(_ sender: Any) {
        print("Botão pressionado")
        labelTesteBotao2.text = "Botão foi clicado!"
        // TODO fazer a imagem desaparecer?
        
        imageTeste.isHidden = !imageTeste.isHidden
        
        
    }
}

