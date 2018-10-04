//
//  SelectVehiclePresenter.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 3/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import Foundation


class SelectVehiclePresenter<T: SelectVehicleViewProtocol>: BasePresenter<T> {
    
    func getAllRegisterVehicle(success:@escaping (([Vehicle]) -> Void)){
        
        let manager = Manager()
        let registerVehicleRequest = SelectVehicleRequest()
        manager.send(registerVehicleRequest, success: { (register) in
            success(register?.data ?? [])
        }) { (error) in
            print(error)
        }
        
    }
    
}
