//
//  SelectVehicleRequest.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 3/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import Foundation

public class SelectVehicleRequest:BaseRequest {}

extension SelectVehicleRequest:RequestService {
    var body: String {
        return ""
    }
    
    public var path: String {
        return ""
    }
    
    public var baseURL: URL {
        return URL(string: "http://localhost:8888/RentCar/web/app_dev.php/vehicle/allRegisterVehicle")!
    }
    
    public typealias Response = SelectVehicleResponse
    
}

