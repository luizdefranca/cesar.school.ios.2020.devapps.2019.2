//
//  AlomofireScreenViewController.swift
//  CocoaPodTests
//
//  Created by Douglas Frari on 9/16/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit
import Alamofire

class AlomofireScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        AF.request("https://httpbin.org/get").response { response in
            debugPrint(response)
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
