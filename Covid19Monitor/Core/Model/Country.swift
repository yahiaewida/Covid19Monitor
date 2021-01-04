//
//  Country.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/24/20.
//

import Foundation

struct Country: Codable {
   
    
    var updated: Int64? = 0
    var country: String? = ""
    var continent: String? = ""
    var cases: Int64? = 0
    var todayCases: Int64? = 0
    var deaths: Int64? = 0
    var todayDeaths: Int64? = 0
    var recovered: Int64? = 0
    var active: Int64? = 0
    var critical: Int64? = 0
    var casesPerOneMillion: Double? = 0.0
    var deathsPerOneMillion: Double? = 0.0
    var tests: Int64? = 0
    var testsPerOneMillion: Double? = 0.0
    var isSubscribed: Bool? = false
    var flag: String? = ""
    var countryInfo: CountryInfo? = CountryInfo()
   
    
}
