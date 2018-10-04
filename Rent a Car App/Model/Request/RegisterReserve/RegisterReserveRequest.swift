//
//  RegisterReserveRequest.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 4/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import Foundation

public class RegisterReserveRequest: BaseRequest {
    
    var name:String
    var lastName:String
    var birthDay:String
    var address:String
    var email:String
    var telephone:String
    var vehicleId:String
    var pickUpDate:String
    var dropOffDate:String
    var reserveNumber:String
    var totalAmount:String
    
    
    init(name:String, lastName:String, birthDay:String, address:String, email:String, telephone:String, vehicleId:String, pickUpDate:String, dropOffDate:String, reserveNumber:String, totalAmount:String) {
        self.name = name
        self.lastName = lastName
        self.birthDay = birthDay
        self.address = address
        self.email = email
        self.telephone = telephone
        self.vehicleId = vehicleId
        self.pickUpDate = pickUpDate
        self.dropOffDate = dropOffDate
        self.reserveNumber = reserveNumber
        self.totalAmount = totalAmount
        
        
    }
    
}

extension RegisterReserveRequest : RequestService {
    var body: String {
        
       let dic = ["name":"\(name)", "lastName":"\(lastName)", "birthDay": "\(birthDay)", "address":"\(address)", "email":"\(email)", "telephone":"\(telephone)","vehicleId":"\(vehicleId)","pickUpDate":"\(pickUpDate)","dropOffDate":"\(dropOffDate)","reserveNumber":"\(reserveNumber)", "totalAmount":"\(totalAmount)"]

            let jsonData = try! JSONSerialization.data(withJSONObject: dic, options: [])
            let decoded = String(data: jsonData, encoding: .utf8)!
            
            return String(format: "json=%@", decoded)
        
    }
    
    var path: String {
        return ""
    }
    
    public var baseURL: URL {
        return URL(string: "http://localhost:8888/RentCar/web/app_dev.php/reserve/add")!
    }
    
    typealias Response = RegisterReserveResponse
    
    
}

