//
//  Session.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 3/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import Foundation

internal final class Session {
    static let shared = Session()
    private init() {}
    
    var cookies: [HTTPCookie] = []
}

