//
//  String.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 3/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import Foundation
import UIKit


extension String {
    func localized() -> String {
        
        let savedLanguage = "es"
        
        if let path = Bundle.main.path(forResource: savedLanguage, ofType: "lproj"),
            let bundle = Bundle(path: path) {
            
            return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
        } else {
            return self
        }
    }
}
