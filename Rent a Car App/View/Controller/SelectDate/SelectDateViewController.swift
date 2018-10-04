//
//  SelectDateViewController.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 3/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import UIKit
import FSCalendar

class SelectDateViewController: BaseViewController {
    @IBOutlet weak var buttonContinuar: UIButton!
    
    @IBOutlet weak var startPickerDate: UIDatePicker!
    @IBOutlet weak var endPickerDate: UIDatePicker!
    
    private var startDate: Date?
    private var endDate: Date?
    private var currentDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    private func setupUI(){

        startPickerDate.timeZone = NSTimeZone.local
        startPickerDate.backgroundColor = UIColor.white
        var components = DateComponents()
        let minDate = Calendar.current.date(byAdding: components, to: Date())
        startPickerDate.minimumDate = minDate
        startPickerDate.addTarget(self, action: #selector(SelectDateViewController.datePickerValueChanged(_:)), for: .valueChanged)
        
        endPickerDate.timeZone = NSTimeZone.local
        endPickerDate.backgroundColor = UIColor.white
        components.hour = +24
        let minDatePickerEnd = Calendar.current.date(byAdding: components, to: Date())
        endPickerDate.minimumDate = minDatePickerEnd
        endPickerDate.addTarget(self, action: #selector(SelectDateViewController.dateEndPickerValueChange(_:)), for: .valueChanged)
        
        startDate = minDate
        endDate = minDatePickerEnd
        
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        let selectedDate: String = dateFormatter.string(from: sender.date)
        
        startDate = dateFormatter.date(from: selectedDate)
        print("Selected value \(selectedDate)")
    }
    
    
    
    @objc func dateEndPickerValueChange(_ sender:UIDatePicker) {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        let selectedDate: String = dateFormatter.string(from: sender.date)
        
        endDate = dateFormatter.date(from: selectedDate)
        print("Selected value \(selectedDate)")
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SelectVehicleViewController,
             segue.identifier == "showSelectVehicle" {
            destination.startDate = startDate
            destination.endDate = endDate
        }
    }
    
    
    @IBAction func buttonContinuarCliked(_ sender: Any) {
        
        if startDate! >= endDate! {
            showErrorMessage("La Fecha de recogida tiene que ser menor a la fecha de entrega.")
        }else {
            
            print("Start Date",startDate)
            print("End Date", endDate)
            
            performSegue(withIdentifier: "showSelectVehicle", sender: self)
            
        }
    }
    
}

