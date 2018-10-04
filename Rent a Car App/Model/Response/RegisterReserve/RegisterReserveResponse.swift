//
//  RegisterReserveResponse.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 4/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import Foundation


struct RegisterReserveResponse: Codable {
    var code:Int
    var info:String
    var reserveNumber:String
}
