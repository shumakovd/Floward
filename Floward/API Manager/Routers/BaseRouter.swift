//
//  BaseRouter.swift
//  Floward
//
//  Created by Shumakov Dmytro on 09.11.2022.
//

import Alamofire
import Foundation

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var encoding: Alamofire.ParameterEncoding? { get }
    var baseURL: URL? { get }
}

class BaseRouter: APIConfiguration {
    init() {}

    var encoding: ParameterEncoding? {
        fatalError("[\(self) - \(#function))] Must be overridden in subclass")
    }

    var method: HTTPMethod {
        fatalError("[\(self) - \(#function))] Must be overridden in subclass")
    }

    var path: String {
        fatalError("[\(self) - \(#function))] Must be overridden in subclass")
    }

    var parameters: Parameters? {
        fatalError("[\(self) - \(#function))] Must be overridden in subclass")
    }

    var keyPath: String? {
        fatalError("[\(self) - \(#function))] Must be overridden in subclass")
    }

    var baseURL: URL? {
        fatalError("[\(self) - \(#function))] Must be overridden in subclass")
    }

    func asURLRequest() throws -> URLRequest {
        let url: URL = URL(string: "https://my-json-server.typicode.com/")!

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = 15

        if let encoding = encoding {
            return try encoding.encode(urlRequest, with: parameters)
        }

        return urlRequest
    }
}
