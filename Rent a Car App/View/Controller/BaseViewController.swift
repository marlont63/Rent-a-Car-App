//
//  BaseViewController.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 3/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import UIKit

@objc protocol BaseViewProtocol: class {
    func showMessage(_ message: String, title: String?, alternativeAction: UIAlertAction?, acceptAction: UIAlertAction)
}


class BaseViewController:UIViewController, BaseViewProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showMessage(_ message: String,
                     title: String?,
                     alternativeAction: UIAlertAction?,
                     acceptAction: UIAlertAction) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let alternativeAction = alternativeAction {
            alert.addAction(alternativeAction)
        }
        
        alert.addAction(acceptAction)
        
        DispatchQueue.main.async {
            UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
        }
    }
    
    func registerTapGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(gesture)
    }
    
    func removeKeyboardChanges() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}



extension BaseViewProtocol {
    
    func showErrorMessage(_ message: String, title: String = "", handler: @escaping (() -> Void) = {}) {
        
        let acceptAction = UIAlertAction(title: "ALERT_BUTTON_ACCEPT".localized(), style: .default) { _ in
            handler()
        }
        
        showMessage(message, title: title, alternativeAction: nil, acceptAction: acceptAction)
    }
    
    func showRetryMessage(_ message: String, title: String = "", retryHandler: @escaping (() -> Void), acceptHandler: (() -> Void)? = nil) {
        
        let retryAction = UIAlertAction(title: "ALERT_BUTTON_RETRY".localized(), style: .default) { _ in
            retryHandler()
        }
        
        let acceptAction = UIAlertAction(title: "ALERT_BUTTON_ACCEPT".localized(), style: .default) { _ in
            acceptHandler?()
        }
        
        showMessage(message, title: title, alternativeAction: retryAction, acceptAction: acceptAction)
    }
    
    func showInfoMessage(_ message: String, title: String = "", handler: @escaping (() -> Void) = {}) {
        let acceptAction = UIAlertAction(title: "ALERT_BUTTON_ACCEPT".localized(), style: .default) { _ in
            handler()
        }
        
        showMessage(message, title: title, alternativeAction: nil, acceptAction: acceptAction)
    }
    
    func showContinueCancelMessage(_ message: String, title: String = "", acceptButtonTitle: String = "ALERT_BUTTON_ACCEPT".localized(), continueHandler: @escaping (() -> Void), cancelHandler: @escaping (() -> Void) = {}) {
        
        let cancelAction = UIAlertAction(title: "ALERT_BUTTON_CANCEL".localized(), style: .default) { _ in
            cancelHandler()
        }
        
        let continueAction = UIAlertAction(title: "ALERT_BUTTON_CONTINUE".localized(), style: .default) { _ in
            continueHandler()
        }
        
        showMessage(message, title: title, alternativeAction: cancelAction, acceptAction: continueAction)
    }
    
    
    func showAcceptCancelMessage(_ message: String, title: String = "", acceptButtonTitle: String = "ALERT_BUTTON_ACCEPT".localized(), acceptHandler: @escaping (() -> Void), cancelHandler: @escaping (() -> Void) = {}) {
        
        let cancelAction = UIAlertAction(title: "ALERT_BUTTON_CANCEL".localized(), style: .default) { _ in
            cancelHandler()
        }
        
        let acceptAction = UIAlertAction(title: acceptButtonTitle, style: .default) { _ in
            acceptHandler()
        }
        
        showMessage(message, title: title, alternativeAction: cancelAction, acceptAction: acceptAction)
    }
    
}
