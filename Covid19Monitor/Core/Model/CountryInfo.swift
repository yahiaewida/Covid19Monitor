//
//  CountryInfo.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/28/20.
//

import Foundation


struct CountryInfo: Codable {
    var id: Int64? = 0
    var lat: Double? = 0.0
    var long: Double? = 0.0
    var flag: String? = ""
    
    enum CodingKeys: String, CodingKey  {
        case id = "_id"
        case lat, long, flag
    }
}
