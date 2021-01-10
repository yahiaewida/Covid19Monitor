//
//  Statistics.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/24/20.
//

import Foundation
import RealmSwift

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
}

class StatisticsRealm: Object {
    @objc dynamic var updated: Int64 = 0
    @objc dynamic var cases: Int64 = 0
    @objc dynamic var todayCases: Int64 = 0
    @objc dynamic var deaths: Int64 = 0
    @objc dynamic var todayDeaths: Int64 = 0
    @objc dynamic var recovered: Int64 = 0
    @objc dynamic var active: Int64 = 0
    @objc dynamic var critical: Int64 = 0
    @objc dynamic var affectedCountries: Int = 0
}
