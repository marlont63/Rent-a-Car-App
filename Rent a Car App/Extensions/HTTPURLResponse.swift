//
//  HTTPURLResponse.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 3/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import Foundation

extension HTTPURLResponse {
    func showLog(from data: Data?) {
        var body: String? = nil
        
        if let json = data {
            body = String(data: json, encoding: .utf8)
        }
        
        var headers: [String: Any] = [:]
        for (key, value) in allHeaderFields {
            headers[key as! String] = value
        }
        
        let logMessage =
        """
        ====== RESPONSE ======
        STATUS CODE: \(statusCode.description)
        HEADERS: \(headers)
        BODY: \(body ?? "EMPTY RESPONSE")
        """
        
        print(logMessage)
    }
}

