//
//  Manager.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 3/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//

import Foundation

internal final class Manager:NSObject {
    
    private var session: URLSession?
    private var queue: CallbackQueue = .main
    
    public init(configuration: URLSessionConfiguration = .default, callbackQueue: CallbackQueue = .main) {
        super.init()
        session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        queue = callbackQueue
    }
    
    deinit {
        session = nil
    }
    
    public func send<Request: RequestService>(_ request: Request, callbackQueue: CallbackQueue? = nil, success: @escaping (_ response: Request.Response?) -> Void, failure: @escaping (_ error: CRError) -> Void) {
        
        let queue = callbackQueue ?? self.queue
        let serverRequest: URLRequest
        
        do {
            serverRequest = try request.build()
        } catch {
            queue.execute {
                failure(.requestError(error))
            }
            return
        }
        
        serverRequest.showLog()
        
        let task = session?.dataTask(with: serverRequest) { data, urlResponse, error in
            
            switch (data, urlResponse, error) {
            case (let data, let urlResponse as HTTPURLResponse, let error?):
                urlResponse.showLog(from: data)
                
                queue.execute {
                    failure(.connectionError(error))
                }
            case (let data?, let urlResponse as HTTPURLResponse, _):
                urlResponse.showLog(from: data)
                
                self.updateCookies(from: urlResponse)
                
                guard 200..<300 ~= urlResponse.statusCode else {
                    queue.execute {
                        failure(.wrongStatusCode(urlResponse.statusCode))
                    }
                    return
                }
                
                switch request.result(from: data) {
                case .success(let response):
                    queue.execute {
                        success(response)
                    }
                case .error(let error):
                    queue.execute {
                        failure(error)
                    }
                }
            default:
                queue.execute {
                    failure(.nonURLResponse(urlResponse))
                }
            }
        }
        
        task?.resume()
    }
    
    private func updateCookies(from response: URLResponse) {
        guard let url = response.url, let cookies = HTTPCookieStorage.shared.cookies(for: url) else { return }
        
        for cookie in cookies {
            if Session.shared.cookies.contains(where: { cookie.name == $0.name }) {
                Session.shared.cookies.update(with: cookie)
            } else {
                Session.shared.cookies.append(cookie)
            }
        }
    }
}

extension Manager: URLSessionDelegate {
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if let serverTrust = challenge.protectionSpace.serverTrust {
            let credential = URLCredential(trust: serverTrust)
            completionHandler(.useCredential, credential)
        } else {
            completionHandler(.performDefaultHandling, nil)
        }
    }
}

