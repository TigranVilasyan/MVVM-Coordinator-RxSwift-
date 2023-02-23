//
//  URLFactory.swift
//  MVVM+C
//
//  Created by Tigran VIasyan on 23.02.23.
//

import Foundation

enum URLs {
    case getCoins
}

class URLFactory {
    
    var baseURL: String {
        return "https://coinranking1.p.rapidapi.com"
    }
    
    func UrlFactory(url: URLs) -> String {
        switch url {
        case .getCoins:
            return baseURL + "/coins"
        }
    }
}
