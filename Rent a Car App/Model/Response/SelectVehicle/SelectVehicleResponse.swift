//
//  SelectVehicleResponse.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 3/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import Foundation


public struct SelectVehicleResponse:Codable {
    var code:String
    var data:[Vehicle]?
}
