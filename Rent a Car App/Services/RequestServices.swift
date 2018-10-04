//
//  RequestServices.swift
//  Rent a Car App
//
//  Created by Marlon Raschid Tavarez Parra on 3/10/18.
//  Copyright © 2018 es.mybcloud. All rights reserved.
//


import Foundation
import UIKit


internal enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

internal enum Result<T: Codable> {
    case success(T?)
    case error(CRError)
}

internal protocol RequestService {
    
    typealias HTTPHeaders = [String : String]
    
    associatedtype Response: Codable
    
    var baseURL: URL { get }
    
    var path: String { get }
    
    var method: HTTPMethod { get }
    
    var headers: HTTPHeaders { get }
    
    var body: String { get }
    
    var timeout: TimeInterval { get }
    
    var sampleData: Data { get }
}

// Default params
extension RequestService {
    
    public var baseURL: URL {
        return URL(string: "")!
    }
    
    public var method: HTTPMethod {
        return .post
    }
    
    public var timeout: TimeInterval {
        return 50
    }
    
    public var headers: HTTPHeaders {
        return ["Content-Type": "application/x-www-form-urlencoded"]
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    // Custom attrs
    var json: String {
        let encodeBody = body
        return encodeBody
    }
}

// Protocol functions
extension RequestService {
    
    func build() throws -> URLRequest {
        
        let url = path.isEmpty ? baseURL : baseURL.appendingPathComponent(path)
        let params = try composeBody()
        
        var request = URLRequest(url: url)
        request.timeoutInterval = timeout
        request.httpMethod = method.rawValue
        
        headers.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        request.addCookies(Session.shared.cookies)
        request.httpBody = params
        
        return request
    }
    
    private func composeBody() throws -> Data {
        return json.data(using: .utf8)!
    }
    
    func result(from data: Data) -> Result<Response> {
        
        let decode = JSONDecoder()
        do {
            let response = try decode.decode(Response.self, from: data)
            return Result.success(response)
            
        } catch {
            return Result.error(.wrongJsonDecodeNames(error))
        }
    }
}
