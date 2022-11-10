//
//  ResourceRouter.swift
//  Floward
//
//  Created by Shumakov Dmytro on 09.11.2022.
//

import Alamofire
import Foundation

enum ResourceEndpoint {
    case getUsers
    case getPosts
}

class ResourceRouter: BaseRouter {
    
    fileprivate var endPoint: ResourceEndpoint

    init(anEndpoint: ResourceEndpoint) {
        endPoint = anEndpoint
    }
    //
    override var method: HTTPMethod {
        switch endPoint {
        case .getUsers, .getPosts:
            return .get
        }
    }
    //
    override var path: String {
        switch endPoint {
        case .getPosts:
            return "SharminSirajudeen/test_resources/posts"
        case .getUsers:
            return "SharminSirajudeen/test_resources/users"
        }
    }
    //
    override var parameters: Parameters? {
        switch endPoint {
        case .getUsers, .getPosts:
            return nil
        }
    }
    //
    override var keyPath: String? {
        return nil
    }
    //
    override var encoding: ParameterEncoding? {
        switch method {
        case .get:
            return JSONEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    //
    override var baseURL: URL? {
        switch endPoint {
        case .getUsers, .getPosts:
            return super.baseURL                        
        }
    }
}
