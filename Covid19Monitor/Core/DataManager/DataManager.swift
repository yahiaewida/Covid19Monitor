//
//  DataManager.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/24/20.
//

import Foundation
import Combine
import RealmSwift


protocol DataManagerProtocol {
    // MARK:- Remote Functions
    func getAllStatistics() -> PassthroughSubject<Statistics,ResponseError>
    func getAllCountriesData() -> PassthroughSubject<Array<Country>,ResponseError>
    func getCountryDetails(countryName: String) -> PassthroughSubject<CountryDetails,ResponseError>
    func getWorldDetails() -> PassthroughSubject<Timeline,ResponseError>
    
    // MARK:- Local Functions
    func addSubscribedCountry(country: CountryRealm) -> Bool
    func removeSubscribedCountry(country: CountryRealm) -> Bool
    func getSubscribedCountries() -> PassthroughSubject<[Country],ResponseError>
}

class DataManager: DataManagerProtocol {
    private let remoteDataHandler = RemoteDataHandler()
    private let localDataHandler = LocalDataHandler()
    
    // MARK:- Remote Functions
    
    func getAllStatistics() -> PassthroughSubject<Statistics,ResponseError> {
        return remoteDataHandler.request(uri: Urls.ALL_STATISTICS)
    }
    
    func getAllCountriesData() -> PassthroughSubject<Array<Country>,ResponseError> {
        return remoteDataHandler.request(uri: Urls.COUNTRIES_STATISTICS)
    }
    
    func getCountryDetails(countryName: String) -> PassthroughSubject<CountryDetails,ResponseError>  {        
        return remoteDataHandler.request(uri: Urls.COUNTRY_DETAILS + countryName + Urls.SEVEN_DAYS_QUERY)
    }
    
    func getWorldDetails() -> PassthroughSubject<Timeline,ResponseError>  {
        return remoteDataHandler.request(uri: Urls.COUNTRY_DETAILS + "all" + Urls.SEVEN_DAYS_QUERY)
    }
    
    // MARK:- Local Functions
    
    func addSubscribedCountry(country: CountryRealm) -> Bool {
        country.isSubscribed = true
        return localDataHandler.addSubscribedCountry(country: country)
    }
    
    func removeSubscribedCountry(country: CountryRealm) -> Bool {
        return localDataHandler.removeSubscribedCountry(country: country)
    }
  
    func getSubscribedCountries() -> PassthroughSubject<[Country],ResponseError> {
        return localDataHandler.getSubscribedCountries()
    }
       
}
