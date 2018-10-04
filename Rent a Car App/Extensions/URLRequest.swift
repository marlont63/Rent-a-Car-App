//
//  URLRequest.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 3/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import Foundation

extension URLRequest {
    mutating func addCookies(_ cookies: [HTTPCookie]) {
        for (key, value) in HTTPCookie.requestHeaderFields(with: cookies) {
            self.setValue(value, forHTTPHeaderField: key)
        }
    }
    
    func showLog() {
        var body: String? = nil
        
        if let json = httpBody {
            body = String(data: json, encoding: .utf8)
        }
        
        let logMessage =
        """
        ====== REQUEST ======
        Method: \(httpMethod ?? "NOT DEFINED")
        URL: \(url?.absoluteString ?? "NOT DEFINED")
        HEADERS: \(allHTTPHeaderFields?.description ?? "NOT DEFINED")
        BODY: \(body ?? "NOT DEFINED")
        """
        
        print(logMessage)
    }
}


