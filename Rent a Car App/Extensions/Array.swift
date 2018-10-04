//
//  Array.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 3/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import Foundation

extension Array where Element: HTTPCookie {
    mutating func update(with element: Element) {
        guard let position = self.index(where: { element.name == $0.name }) else { return }
        self[position] = element
    }
}
