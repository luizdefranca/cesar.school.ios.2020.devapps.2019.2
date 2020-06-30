//
//  WorldCupViewController.swift
//  Campeoes
//
//  Created by Douglas Frari on 17/06/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

class WorldCupViewController: UIViewController {

    @IBOutlet weak var ivWinner: UIImageView!
    @IBOutlet weak var ivVice: UIImageView!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var lbWinner: UILabel!
    @IBOutlet weak var lbVice: UILabel!
        
    @IBOutlet weak var tableView: UITableView!
    
    
    var worldCup: WorldCup!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "WorldCup \(worldCup.year)"
        
        
        ivWinner.image = UIImage(named: worldCup.winner)
        ivVice.image = UIImage(named: worldCup.vice)
        lbScore.text = "\(worldCup.winnerScore) x \(worldCup.viceScore)"
        lbWinner.text = worldCup.winner
        lbVice.text = worldCup.vice
     
        // fazer programaticamente para inserir dados na tabela
        tableView.dataSource = self
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

} //  fim da classe

extension WorldCupViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        // total de etapas ate me tornar campeao (ex. oitavas, quartas, etc)
        return worldCup.matches.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // total de linhas para cada secao
        return worldCup.matches[section].games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
//        let worldCup = worldCups[indexPath.row]
//        cell.prepare(with: worldCup)
        // teste temporario
        cell.textLabel?.text = " 2 x 2"
        
        return cell
    }
    
    
    
}
