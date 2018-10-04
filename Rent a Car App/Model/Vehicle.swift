//
//  Vehicle.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 3/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import Foundation

struct Vehicle:Codable {
    var id:Int
    var vehicletype:String
    var vehiclegroup:String
    var vehiclebrand:String
    var vehiclemodel:String
    var vehicleseats:Int
    var vehicledoors:Int
    var vehicletransmission:String
    var vehiclefuel:String
    var vehicleimage:String
    var vehiclepriceperday:Float
    var vehicleobservations:String
}
