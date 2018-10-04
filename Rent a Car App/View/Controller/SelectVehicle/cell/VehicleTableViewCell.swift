//
//  VehicleTableViewCell.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 4/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import UIKit

class VehicleTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var vehicleImage: UIImageView!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var seatsLabel: UILabel!
    
    @IBOutlet weak var doorsLabel: UILabel!
    @IBOutlet weak var transmissionLabel: UILabel!
    @IBOutlet weak var fuelLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    func config(vehicle:Vehicle) {
        
       let url = URL(string: "http://localhost:8888/RentCar/web/uploads/vehicles/" + vehicle.vehicleimage)
        let data = try? Data(contentsOf: url!)
        vehicleImage.image = UIImage(data: data!)
        
        brandLabel.text = vehicle.vehiclebrand
        modelLabel.text = vehicle.vehiclemodel
        
        groupLabel.text = "Grupo:" + vehicle.vehiclegroup
        typeLabel.text = "Tipo:" + vehicle.vehicletype
        
        doorsLabel.text = "Puertas:" + vehicle.vehicledoors.description
        seatsLabel.text = "Asientos:" + vehicle.vehicleseats.description
        
        fuelLabel.text = vehicle.vehiclefuel
        transmissionLabel.text = vehicle.vehicletransmission
        
        priceLabel.text = vehicle.vehiclepriceperday.description + " EUR"
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
