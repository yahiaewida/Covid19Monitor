//
//  CountriesViewModel.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/28/20.
//


import Foundation
import Combine

class CountriesViewModel: BaseViewModel, ObservableObject {    
    @Published private(set) var countriesData = [Country]()
    @Published private(set) var continents = [String]()   
    
    override init () {
        super.init()
        self.getAllCountriesData()
    }
    
    private func getAllCountriesData() {
        dataManager.getAllCountriesData().combineLatest(dataManager.getSubscribedCountries()).sink { [weak self] (error) in
            self?.countriesData = [Country]()
            self?.isLoading = false
        } receiveValue: { [weak self ](apiCountries,subscribedCountries) in
            guard let self = self else { return }
            self.isLoading = false
            var combinedResult = [Country]()
            apiCountries.forEach { country in
                var apiCountry =  country
                subscribedCountries.forEach { subscribedCountry in
                    if subscribedCountry.country == apiCountry.country {
                        apiCountry.isSubscribed = true
                    }
                }
                combinedResult.append(apiCountry)
            }
            self.countriesData = combinedResult
        }.store(in: &subscriptions)
    }
}
