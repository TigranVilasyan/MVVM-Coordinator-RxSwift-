//
//  BaseRequestProtocol.swift
//  MVVM+C
//
//  Created by Tigran VIasyan on 23.02.23.
//

import Alamofire

protocol BaseRequestProtocol {
    func baseRequest<T: Decodable>(urlRequest: URLRequest?, completion: @escaping (_ responseObject: T?, _ success: Bool, _ error: Error?) -> Void)
}

extension BaseRequestProtocol {
    func baseRequest<T: Decodable>(urlRequest: URLRequest?, completion: @escaping (_ responseObject: T?, _ success: Bool, _ error: Error?) -> Void) {
        guard let request = urlRequest else { return }
        AF.request(request).responseDecodable { (response: DataResponse<T, AFError>) in
            
            switch response.result {
            case .success(let object):
                if let json = try? JSONSerialization.jsonObject(with: response.data!, options: .mutableContainers),
                   let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
                    print(String(decoding: jsonData, as: UTF8.self))
                } else {
                    print("json data malformed")
                }
                completion(object, true, nil)
            case .failure(let error):
                completion(nil, false, error)
            }
        }
    }
}

