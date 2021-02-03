//
//  LocalDataHandler.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 1/5/21.
//

import Foundation
import RealmSwift
import Combine

func isTutorialRequired() -> Bool {
    let value = UserDefaults().object(forKey: "isTutorialRequired")
    return (value as? Bool) ?? true
}
func setTutorialRequired(to value: Bool) {
    UserDefaults().setValue(value, forKey: "isTutorialRequired")
}

class LocalDataHandler {
    private let realm = try! Realm()
    private var countriesToken: NotificationToken?
    
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
        let realmObject = realm.objects(CountryRealm.self).filter("country = %@", country.country).first // must get the real object contains the values otherwise Exception would be thrown
        var result = false
        if let realmObject = realmObject {
            do {
                try realm.write {
                    realm.delete(realmObject)
                    result = true
                }
            }  catch {
                result = false
            }
        }
        return result
    }
    
    func getSubscribedCountries() -> PassthroughSubject<[Country],ResponseError> {
        let countrySubject = PassthroughSubject<[Country],ResponseError>()
        let data = realm.objects(CountryRealm.self)
        
        countriesToken = data.observe { _ in
            countrySubject.send(Array(data).toCountryArray())
        }
        return countrySubject
    }
    
    deinit {
        countriesToken?.invalidate()
    }
}


