//
//  DataManager.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/24/20.
//

import Foundation
import Combine

struct DataManager {
    private let remoteDataHandler = RemoteDataHandler()
  
    func getAllStatistics() -> PassthroughSubject<Statistics,ResponseError> {
        return remoteDataHandler.request(uri: Urls.ALL_STATISTICS)
    }
    
    func getAllCountriesData() -> PassthroughSubject<Array<Country>,ResponseError> {
        return remoteDataHandler.request(uri: Urls.COUNTRIES_STATISTICS)
    }
    
    func getCountryDetails(countryName: String) -> PassthroughSubject<CountryDetails,ResponseError>  {
        return remoteDataHandler.request(uri: Urls.COUNTRY_DETAILS + countryName + Urls.SEVEN_DAYS_QUERY)
    }
}
