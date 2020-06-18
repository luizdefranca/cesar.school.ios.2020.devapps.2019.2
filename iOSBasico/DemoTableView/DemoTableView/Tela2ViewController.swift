//
//  Tela2ViewController.swift
//  DemoTableView
//
//  Created by Douglas Frari on 17/06/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

class Tela2ViewController: UIViewController {

    var aluno:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let aluno = aluno {
            self.title = aluno
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
