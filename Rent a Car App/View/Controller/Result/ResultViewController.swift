//
//  ResultViewController.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 4/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import Foundation
import UIKit


class ResultViewController: BaseViewController {
    
    var reserveNumber:String!
    
    @IBOutlet weak var reserveNumberLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reserveNumberLabel.text = "Número de reserva: " + reserveNumber
        
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.isUserInteractionEnabled = false
        
    }
    
    @IBAction func aceptButtonClicked(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
    }
    
}


