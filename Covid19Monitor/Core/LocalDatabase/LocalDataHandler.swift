//
//  LocalDataHandler.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 1/5/21.
//

import Foundation
import RealmSwift
import Combine

class LocalDataHandler {
    let realm = try! Realm()
    
    func addSubscribedCountry(country: CountryRealm) -> Bool {
        var result = false
        do {
            try realm.write {
                realm.add(country)
                result = true
            }
        }  catch {
            result = false
        }
        return result
    }
    
    func removeSubscribedCountry(country: CountryRealm) -> Bool {
        var result = false
        do {
            try realm.write {
                realm.delete(country)
                result = true
            }
        }  catch {
            result = false
        }
        return result
    }
    
    
    func getSubscribedCountries() -> Results<CountryRealm> {
         realm.objects(CountryRealm.self)
    }
    
}
