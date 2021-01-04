//
//  Statistics.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/24/20.
//

import Foundation


struct Statistics: Codable {
    var updated: Int64 = 0
    var cases: Int64 = 0
    var todayCases: Int64 = 0
    var deaths: Int64 = 0
    var todayDeaths: Int64 = 0
    var recovered: Int64 = 0
    var active: Int64 = 0
    var critical: Int64 = 0
    var affectedCountries: Int = 0
    
    init() {}
}
