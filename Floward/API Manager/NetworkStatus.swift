//
//  NetworkStatus.swift
//  Floward
//
//  Created by Shumakov Dmytro on 09.11.2022.
//

import Alamofire
import Foundation

class NetworkStatus {
    static let sharedInstance = NetworkStatus()

    private init() {}

    /// Using:
    /// if NetworkStatus.isConnectedToInternet() {
    ///    true
    /// }
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

