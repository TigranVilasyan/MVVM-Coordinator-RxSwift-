//
//  CoinsRequest.swift
//  MVVM+C
//
//  Created by Tigran VIasyan on 22.02.23.
//

import Foundation
import Alamofire

class CoinsRequest: APIServiceProtocol {
    func getCoins(query: CoinsRequestQuery, completion: @escaping (_ response: Coins?, _ success: Bool, _ error: Error?) -> Void) {
        request(query: query, completion: completion)
    }
}

class CoinsRequestQuery: APIServiceQueryProtocol {
    
    var limit: Int
    var offset: Int
    
    init(limit: Int = 1, offset: Int = 50) {
        self.limit = limit
        self.offset = offset
    }
    
    func requestParams() -> [String : Any]? {
        return [
            "referenceCurrencyUuid": "yhjMzLPhuIDl",
            "timePeriod": "24h",
            "tiers": "2",
            "orderBy": "marketCap",
            "orderDirection": "desc",
            "limit": String(limit),
            "offset": String(offset),
        ]
    }
    
    func requestURL() -> String {
        return URLFactory().UrlFactory(url: .getCoins)
    }
    
    func requestMethod() -> HTTPMethods {
        return .GET
    }
    
    func requestObject() -> Any? {
        return nil
    }
    
    func requestContentTipe() -> ContentType {
        return .json
    }
    
    func requestCustomHeaders() -> [String: String]? {
        return [
            "X-RapidAPI-Key": "837f39b712msh0375f4a19618675p1a01e9jsnc6486ba5304b",
            "X-RapidAPI-Host": "coinranking1.p.rapidapi.com"
        ]
        
    }
}
