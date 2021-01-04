//
//  CountryDetails.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 1/3/21.
//

import Foundation


struct CountryDetails: Codable {
    var country: String
    var timeline: Timeline
    
    init() {
        country = ""
        timeline = Timeline(cases: ["" : 0], deaths: ["" : 0], recovered: ["" : 0])
    }
}

struct Timeline: Codable {
    let cases, deaths, recovered: [String: Double]
}
