//
//  BasePresenter.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 3/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import Foundation

class BasePresenter<T: BaseViewProtocol> {
    
    private weak var _view: T?
    
    var view: T? {
        return _view
    }
    
    init(_ view: T) {
        _view = view
    }
    
    deinit {
        _view = nil
    }
}

