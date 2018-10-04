//
//  InsertClienteViewController.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 4/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import Foundation
import UIKit

protocol InsertClientViewProtocol: BaseViewProtocol {
    
}


class InsertClienteViewController: BaseViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var birthDayTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    var vehicle:Vehicle!
    var startDate: Date!
    var endDate: Date!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func accepButtonAction(_ sender: Any) {
        
         if nameTextField.text != "",
        lastNameTextField.text != "",
        birthDayTextField.text != "",
        emailTextField.text != "",
        phoneTextField.text != "",
        addressTextField.text  != "" {
            
            let client = Client(name: nameTextField.text!, lastName: lastNameTextField.text!, birthDay:birthDayTextField.text!, email:emailTextField.text!, phone:phoneTextField.text!, address:addressTextField.text!)
            
            performSegue(withIdentifier: "showSummary", sender: client)
            
         }else {
            showErrorMessage("Datos incompleto!!")
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SummaryViewController,
            segue.identifier == "showSummary" {
            destination.startDate = startDate
            destination.endDate = endDate
            destination.vehicle = vehicle
            destination.client = sender as? Client
        }
    }
    
}


extension InsertClienteViewController: InsertClientViewProtocol {
    
}
