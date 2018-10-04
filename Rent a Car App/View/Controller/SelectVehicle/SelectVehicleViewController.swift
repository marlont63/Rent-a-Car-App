//
//  SelectVehicleViewController.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 3/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import UIKit

protocol SelectVehicleViewProtocol: BaseViewProtocol {
    
}


class SelectVehicleViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    
     var startDate: Date?
     var endDate: Date?
    
    var AllVehicles:[Vehicle] = []
    
    
    
    private var presenter:SelectVehiclePresenter<SelectVehicleViewController>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SelectVehiclePresenter(self)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.getAllRegisterVehicle(success: { vehicles in
            self.AllVehicles = vehicles
            self.tableView.reloadData()
        })
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? InsertClienteViewController,
            segue.identifier == "showInsertClient" {
            destination.startDate = startDate
            destination.endDate = endDate
            destination.vehicle = sender as! Vehicle
        }
    }
    
}


extension SelectVehicleViewController: SelectVehicleViewProtocol{
    
}


extension SelectVehicleViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showInsertClient", sender: AllVehicles[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

extension SelectVehicleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AllVehicles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellVehicle", for: indexPath) as? VehicleTableViewCell {
            
            cell.config(vehicle: AllVehicles[indexPath.row])
            
            return cell
    
        }else {
            return UITableViewCell()
        }
    }
    
}
