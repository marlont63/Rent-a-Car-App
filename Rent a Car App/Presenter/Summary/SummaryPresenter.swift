//
//  SummaryPresenter.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 4/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import Foundation


class SummaryPresenter<T: SummaryViewProtocol>: BasePresenter<T> {
    
    func registerReserve(client: Client, vehicle:Vehicle, startDate:String, endDate:String, total:Float) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "ddMMyyHHmmss"
        formatter.locale = NSLocale(localeIdentifier: "es_ES_POSIX") as Locale!
        let reserveNumber = formatter.string(from: Date())
        
        let  registerReserveRequest = RegisterReserveRequest(name: client.name, lastName: client.lastName, birthDay: client.birthDay, address: client.address
            , email: client.email, telephone: client.email, vehicleId: vehicle.id.description, pickUpDate: startDate, dropOffDate: endDate, reserveNumber: reserveNumber, totalAmount: total.description)
        let manager = Manager()
        manager.send(registerReserveRequest, success: { (response) in
            
            self.view?.goToResult(number: response?.reserveNumber ?? "")
        }) { (error) in
            print(error)
        }
        
    }
}
