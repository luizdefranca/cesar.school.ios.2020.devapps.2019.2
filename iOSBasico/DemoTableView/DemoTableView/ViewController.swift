//
//  ViewController.swift
//  DemoTableView
//
//  Created by Douglas Frari on 17/06/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var alunos: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // registrando programaticamente para alimentar a tabela
        tableView.dataSource = self
        
        
        alunos.append("João")
        alunos.append("Juliano")
        alunos.append("Batman")
        alunos.append("Douglas")
        alunos.append("Maria")
        alunos.append("Potter")
        
        
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // para obter o que foi clicado na tabela
        let aluno = alunos[tableView.indexPathForSelectedRow!.row]
        print("Aluno: \(aluno)")
        
        // para repassar o valor para a outra tela
        let vc = segue.destination as? Tela2ViewController
        vc?.aluno = aluno
    }
    
    
    
    
    
} // fim da classe

extension ViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alunos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = alunos[indexPath.row]
        
        
        return cell
        
        
    }
    
}



