//
//  Constants.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/24/20.
//

import Foundation

struct Urls {
    static let BASE_URL = "https://disease.sh/v2/"
    static let ALL_STATISTICS = "all"
    static let COUNTRIES_STATISTICS = "countries?sort=cases"
    static let COUNTRY_DETAILS = "historical/"
    static let SEVEN_DAYS_QUERY = "?lastdays=7"
}


var continentsKeys = [
    "All","EU","AF","NA","OC","AS","SA"
]

var continentsKeysMapping : [String : String] {
    return [
        continentsKeys[0] : "All",
        continentsKeys[1] : "Europe",
        continentsKeys[2] : "Africa",
        continentsKeys[3] : "North America",
        continentsKeys[4] : "Australia/Oceania",
        continentsKeys[5] : "Asia",
        continentsKeys[6] : "South America"
    ]
}
