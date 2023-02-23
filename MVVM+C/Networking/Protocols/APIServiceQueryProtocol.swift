//
//  APIServiceQueryProtocol.swift
//  MVVM+C
//
//  Created by Tigran VIasyan on 23.02.23.
//

import Foundation
import Alamofire

public enum ContentType: String {
    case authorization = "Bearer Token"
    case text = "text/plain"
    case json = "application/json"
    case formUrlencoded = "application/x-www-form-urlencoded"
    case multipart = "multipart/form-data"
}

protocol APIServiceQueryProtocol {
    func requestURL() -> String
    func requestParams() -> [String: Any]?
    func requestCustomHeaders() -> [String: String]?
    func requestMethod() -> HTTPMethods
    func requestObject() -> Any?
    func requiresToken() -> Bool
    func requestContentTipe() -> ContentType
}

extension APIServiceQueryProtocol {
    func requestContentTipe() -> ContentType {
        return .formUrlencoded
    }
    
    func requestObject() -> Any? {
        return nil
    }
    
    func requiresToken() -> Bool {
        return true
    }
    func requestCustomHeaders() -> [String: String]? {
        return nil
    }
}
