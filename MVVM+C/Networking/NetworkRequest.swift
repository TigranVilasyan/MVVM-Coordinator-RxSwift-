//
//  NetworkRequest.swift
//  MVVM+C
//
//  Created by Tigran VIasyan on 22.02.23.
//

import Foundation
import Alamofire

protocol NetworkRequest {
    var baseURL: String? { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var customHeaders: [String: String]? { get }    
}

extension NetworkRequest {
    var baseURL: String? { nil }
    var bodyParameters: [String: String]? { nil }
    var customHeaders: [String: String]? { nil }
}

