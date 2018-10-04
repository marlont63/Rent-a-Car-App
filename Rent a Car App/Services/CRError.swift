//
//  CRError.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 3/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import Foundation


public enum CRError: Swift.Error {
    
    case signatureNotValid
    case connectionError(Error)
    
    case responseError(Error)
    case nonURLResponse(URLResponse?)
    case wrongStatusCode(Int)
    case wrongJsonFormat
    case wrongJsonDecodeNames(Error)
    case serverError(Int)
    case wrongErrorServerCode
    
    case resultOkNoEncryptData(Int)
    
    case malformedURL(URL)
    case wrongBodyJsonFormat
    case wrongBodyData
    case requestError(Error)
    case internalError
    
    var code: Int {
        switch self {
        case .serverError(let code):
            return code
        case .wrongStatusCode(let code):
            return code
        case .resultOkNoEncryptData(let code):
            return code
        case .nonURLResponse(_ ):
            return 500
        case .wrongBodyData:
            return 9099
        case .wrongJsonDecodeNames( _):
            return 9099
        default:
            return -1
        }
    }
}
