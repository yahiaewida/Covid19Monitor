//
//  DataManager.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/24/20.
//

import Foundation
import Combine

struct DataManager {
    let remoteDataHandler = RemoteDataHandler()
  
    func getAllStatistics() -> PassthroughSubject<Statistics,ResponseError> {
        return RemoteDataHandler().request(uri: Urls.ALL_STATISTICS)
    }
}
