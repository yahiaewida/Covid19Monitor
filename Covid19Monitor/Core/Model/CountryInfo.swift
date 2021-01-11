//
//  CountryInfo.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/28/20.
//

import Foundation
import RealmSwift

struct CountryInfo: Codable {
    var id: Int64? = 0
    var lat: Double? = 0.0
    var long: Double? = 0.0
    var flag: String? = ""
    
    enum CodingKeys: String, CodingKey  {
        case id = "_id"
        case lat, long, flag
    }
    
    func toRealmObject() -> CountryInfoRealm {
        let countryInfo = CountryInfoRealm()
        countryInfo.id = id ?? 0
        countryInfo.lat = lat ?? 0
        countryInfo.long = long ?? 0
        countryInfo.flag = flag ?? ""
        return countryInfo
    }
}

class CountryInfoRealm : Object {
    @objc dynamic var id: Int64 = 0
    @objc dynamic var lat: Double = 0.0
    @objc dynamic var long: Double = 0.0
    @objc dynamic var flag: String = ""
   
    func toCountryInfoObject() -> CountryInfo {
        var countryInfo = CountryInfo()
        countryInfo.id = id
        countryInfo.lat = lat
        countryInfo.long = long
        countryInfo.flag = flag
        return countryInfo
    }
}
