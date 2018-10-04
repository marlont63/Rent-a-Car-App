//
//  CallbackQueue.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 3/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import Foundation

public enum CallbackQueue {
    case main
    case current
    case operationQueue(OperationQueue)
    case dispatchQueue(DispatchQueue)
    
    public func execute(closure: @escaping () -> Void) {
        switch self {
        case .main:
            DispatchQueue.main.async {
                closure()
            }
        case .current:
            closure()
        case .operationQueue(let operationQueue):
            operationQueue.addOperation {
                closure()
            }
        case .dispatchQueue(let dispatchQueue):
            dispatchQueue.async {
                closure()
            }
        }
    }
}
