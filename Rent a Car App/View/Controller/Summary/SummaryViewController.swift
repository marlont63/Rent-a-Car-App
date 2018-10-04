//
//  SummaryViewController.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 4/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import Foundation
import UIKit

protocol SummaryViewProtocol:BaseViewProtocol {
    func goToResult(number:String)
}

class SummaryViewController: BaseViewController {
    
    @IBOutlet weak var clientNameLabel: UILabel!
    @IBOutlet weak var vehicleInfoLabel: UILabel!
    
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    
    @IBOutlet weak var totalDaysLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var vehicle:Vehicle!
    var startDate: Date!
    var endDate: Date!
    var client:Client!
    
    var total:Float = 0.0
    
    var dateStartStringNew = ""
    var dateEndStringnew = ""
    
    var presenter:SummaryPresenter<SummaryViewController>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = SummaryPresenter(self)
        
        clientNameLabel.text = client.name + " " + client.lastName
        vehicleInfoLabel.text = vehicle.vehiclebrand + " " + vehicle.vehiclemodel
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm"
        let dateStartString = dateFormatter.string(from: startDate!)
        let dateEndString = dateFormatter.string(from: endDate!)
        
        startDateLabel.text = dateStartString //startDate.description
        endDateLabel.text = dateEndString //endDate.description
        
        
        let dateFormatterRegister = DateFormatter()
        dateFormatterRegister.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        self.dateStartStringNew = dateFormatterRegister.string(from: startDate)
        self.dateEndStringnew = dateFormatterRegister.string(from: endDate)
        
        let calendar = NSCalendar.current
        let date1 = calendar.startOfDay(for: startDate)
        let date2 = calendar.startOfDay(for: endDate)
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        
        totalDaysLabel.text = "Total de dias: " + components.day!.description
        totalLabel.text = "Total a pagar: " + String(Float(components.day!) * vehicle.vehiclepriceperday ) + " EUR"
        
        total = Float(components.day!) * vehicle.vehiclepriceperday
    }
    
    @IBAction func buttonConfirmClicked(_ sender: Any) {
        
        presenter.registerReserve(client: self.client, vehicle: self.vehicle
            , startDate: self.dateStartStringNew, endDate: self.dateEndStringnew, total: total)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ResultViewController,
            segue.identifier == "showResult" {
            destination.reserveNumber = sender as! String
        }
    }
    
}

extension SummaryViewController: SummaryViewProtocol {
    func goToResult(number: String) {
        performSegue(withIdentifier: "showResult", sender: number)
    }
}

