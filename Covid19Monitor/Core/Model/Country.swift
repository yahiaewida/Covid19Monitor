//
//  Country.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/24/20.
//

import Foundation
import RealmSwift

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
    var countryInfo: CountryInfo? = CountryInfo()
    
    func toRealmObject() -> CountryRealm{
        let countryRealm = CountryRealm()
        countryRealm.updated = updated!
        countryRealm.country = country!
        countryRealm.continent = continent ?? ""
        countryRealm.cases = cases ?? 0
        countryRealm.todayCases = todayCases ?? 0
        countryRealm.recovered = recovered ?? 0
        countryRealm.active = active ?? 0
        countryRealm.deaths = deaths ?? 0
        countryRealm.critical = critical ?? 0
        countryRealm.casesPerOneMillion = casesPerOneMillion ?? 0
        countryRealm.deathsPerOneMillion = deathsPerOneMillion ?? 0
        countryRealm.tests = tests ?? 0
        countryRealm.testsPerOneMillion = testsPerOneMillion ?? 0
        countryRealm.isSubscribed = isSubscribed ?? false
        countryRealm.countryInfo = (countryInfo ?? CountryInfo()).toRealmObject()
        return countryRealm
    }
}


class CountryRealm: Object {
    @objc dynamic var updated: Int64 = 0
    @objc dynamic var country: String = ""
    @objc dynamic var continent: String = ""
    @objc dynamic var cases: Int64 = 0
    @objc dynamic var todayCases: Int64 = 0
    @objc dynamic var deaths: Int64 = 0
    @objc dynamic var todayDeaths: Int64 = 0
    @objc dynamic var recovered: Int64 = 0
    @objc dynamic var active: Int64 = 0
    @objc dynamic var critical: Int64 = 0
    @objc dynamic var casesPerOneMillion: Double = 0.0
    @objc dynamic var deathsPerOneMillion: Double = 0.0
    @objc dynamic var tests: Int64 = 0
    @objc dynamic var testsPerOneMillion: Double = 0.0
    @objc dynamic var isSubscribed: Bool = false
    @objc dynamic var countryInfo: CountryInfoRealm? = CountryInfoRealm()
    
    override class func primaryKey() -> String? {
        return "country"
    }
    
    func toCountryObject() -> Country{
        var countryObj = Country()
        countryObj.updated = updated
        countryObj.country = country
        countryObj.continent = continent
        countryObj.cases = cases
        countryObj.todayCases = todayCases
        countryObj.recovered = recovered
        countryObj.active = active
        countryObj.critical = critical
        countryObj.deaths = deaths
        countryObj.casesPerOneMillion = casesPerOneMillion
        countryObj.deathsPerOneMillion = deathsPerOneMillion
        countryObj.tests = tests
        countryObj.testsPerOneMillion = testsPerOneMillion
        countryObj.isSubscribed = isSubscribed
        countryObj.countryInfo = (countryInfo ?? CountryInfoRealm()).toCountryInfoObject()
        return countryObj
    }
}
