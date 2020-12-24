//
//  Statistics.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/24/20.
//

import Foundation


struct Statistics: Codable {
    let updated: Int64
    let cases: Int64
    let todayCases: Int64
    let deaths: Int64
    let todayDeaths: Int64
    let recovered: Int64
    let active: Int64
    let critical: Int64
    let affectedCountries: Int
}
