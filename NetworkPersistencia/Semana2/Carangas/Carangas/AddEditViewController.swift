//
//  AddEditViewController.swift
//  Carangas
//
//  Created by Eric Brito.
//  Copyright © 2017 Eric Brito. All rights reserved.
//

import UIKit

class AddEditViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tfBrand: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPrice: UITextField!
    @IBOutlet weak var scGasType: UISegmentedControl!
    @IBOutlet weak var btAddEdit: UIButton!
    @IBOutlet weak var loading: UIActivityIndicatorView!

    
    // MARK: - Properties
    var car: Car?
    
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if car != nil {
            // modo edicao
            tfBrand.text = car?.brand
            tfName.text = car?.name
            tfPrice.text = "\(car?.price ?? 0)"
            scGasType.selectedSegmentIndex = car!.gasType
            btAddEdit.setTitle("Alterar carro", for: .normal)
        }
        
    }
    
    // MARK: - IBActions
    @IBAction func addEdit(_ sender: UIButton) {
        
        if car == nil {
            // adicionar carro novo
            car = Car()
        }
        
        car?.name = (tfName?.text)!
        car?.brand = (tfBrand?.text)!
        if tfPrice.text!.isEmpty {
            tfPrice.text = "0"
        }
        car?.price = Double(tfPrice.text!)!
        car?.gasType = scGasType.selectedSegmentIndex
        
        
        if car?._id == nil {
            // new car
            // 1 - devemos chamar o metodo para enviar o carro para o servidor
            REST.save(car: car!) { (sucess) in
                if sucess {
                    // o servidor conseguiu
                    self.goBack()
                    
                } else {
                    // TODO exibir um alerta para usuario aqui
                    print("Servidor nao conseguiu criar o CARRO")
                }
            }
        } else {
            // 2 - edit current car
            REST.update(car: car!) { (sucess) in
                if sucess {
                    // o servidor conseguiu
                    self.goBack()
                    
                } else {
                    // TODO exibir um alerta para usuario aqui
                    print("Servidor nao conseguiu EDITAR o CARRO")
                }
            }
        }
        
        
        
        
        
    }
    
    func goBack() {
        
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
        
    }

}
