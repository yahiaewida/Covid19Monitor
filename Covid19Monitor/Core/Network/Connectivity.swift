//
//  Connectivity.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/24/20.
//

import Foundation
import Alamofire

class Connectivity {
    static func isConnected() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false        
    }
}
