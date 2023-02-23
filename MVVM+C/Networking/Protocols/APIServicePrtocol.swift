//
//  APIServicePrtocol.swift
//  MVVM+C
//
//  Created by Tigran VIasyan on 23.02.23.
//

import Foundation
import Alamofire

enum HTTPMethods {
    case POST
    case GET
    case PUT
    case DELETE
}

enum URLCreationError: Error {
    case couldNotFormAURL
}

protocol APIServiceProtocol: BaseRequestProtocol {
    func request<T: Decodable>(url: String, completion: @escaping (_ responseObject: T?, _ success: Bool, _ error: Error?) -> Void)
}

extension APIServiceProtocol {
    func request<T: Decodable>(url: String, completion: @escaping (_ responseObject: T?, _ success: Bool, _ error: Error?) -> Void) {
        let urlRequest = try? createURLRequest(url: url, params: nil, method: getHTTPMethod(method: .GET), customHeaders: nil, isTokenRequired: false, contentType: .json)
        baseRequest(urlRequest: urlRequest, completion: completion)
    }
    
    func request<T: Decodable>(query: APIServiceQueryProtocol, completion: @escaping (_ responseObject: T?, _ success: Bool, _ error: Error?) -> Void) {
        let url = query.requestURL()
        let params = query.requestParams()
        let customHeaders = query.requestCustomHeaders()
        let method = query.requestMethod()
        let isTokenRequired = query.requiresToken()
        let object = query.requestObject()
        var urlRequest: URLRequest?
        
        urlRequest = try? createURLRequest(url: url, params: params, method: getHTTPMethod(method: method), customHeaders: customHeaders, isTokenRequired: isTokenRequired, contentType: query.requestContentTipe())
        baseRequest(urlRequest: urlRequest, completion: completion)
    }
}


extension APIServiceProtocol {
    
    fileprivate func createURLRequest(url: String, params: [String: Any]?, method: String, customHeaders: [String: String]?, isTokenRequired: Bool, contentType: ContentType) throws -> URLRequest {
        guard let urlValue = URL(string: url) else {
            throw URLCreationError.couldNotFormAURL
        }
        print(customHeaders ?? [])
        var request = URLRequest(url: urlValue, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 15.5)
        request.httpMethod = method
        if method == getHTTPMethod(method: .POST) || method == getHTTPMethod(method: .PUT) {
            let theJSONData = try? JSONSerialization.data(withJSONObject: params ?? ["": ""], options: [])
            request.httpBody = theJSONData
        }
        if params != nil {
            request = try URLEncoding.default.encode(request, with: params!)
            //print(request)
        }
//        request.setValue(contentType.rawValue, forHTTPHeaderField: "Content-Type")
//        // request.setValue(contentType.rawValue, forHTTPHeaderField: "Authorization")
                request.setValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
        if let headers = customHeaders {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }
    
    fileprivate func getHTTPMethod(method: HTTPMethods) -> String {
        switch method {
        case .GET:
            return "GET"
        case .POST:
            return "POST"
        case .PUT:
            return "PUT"
        case .DELETE:
            return "DELETE"
        }
    }
}
