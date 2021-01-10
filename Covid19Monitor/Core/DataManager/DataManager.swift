//
//  DataManager.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/24/20.
//

import Foundation
import Combine
import RealmSwift

class DataManager {
    private let remoteDataHandler = RemoteDataHandler()
    private let localDataHandler = LocalDataHandler()
    private var countriesToken: NotificationToken?
    
    func getAllStatistics() -> PassthroughSubject<Statistics,ResponseError> {
        return remoteDataHandler.request(uri: Urls.ALL_STATISTICS)
    }
    
    func getAllCountriesData() -> PassthroughSubject<Array<Country>,ResponseError> {
        return remoteDataHandler.request(uri: Urls.COUNTRIES_STATISTICS)
    }
    
    func getCountryDetails(countryName: String) -> PassthroughSubject<CountryDetails,ResponseError>  {
        if countryName == "all" {
            print("test")
        }
        return remoteDataHandler.request(uri: Urls.COUNTRY_DETAILS + countryName + Urls.SEVEN_DAYS_QUERY)
    }
    
    func addSubscribedCountry(country: CountryRealm) -> Bool {
        country.isSubscribed = true
        return localDataHandler.addSubscribedCountry(country: country)
    }
    
    func removeSubscribedCountry(country: CountryRealm) -> Bool {
        return localDataHandler.removeSubscribedCountry(country: country)
    }
  
    func getSubscribedCountries() -> PassthroughSubject<[Country],ResponseError> {
        let countrySubject = PassthroughSubject<[Country],ResponseError>()
        let data = localDataHandler.getSubscribedCountries()
        countriesToken = data.observe { _ in
            countrySubject.send(Array(data).toCountryArray())
        }
        return countrySubject
    }
    
    deinit {
        countriesToken?.invalidate()
    }
}
