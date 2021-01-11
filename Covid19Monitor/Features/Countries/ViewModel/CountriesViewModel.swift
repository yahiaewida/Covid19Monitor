//
//  CountriesViewModel.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/28/20.
//


import Foundation
import Combine

class CountriesViewModel: BaseViewModel, ObservableObject {    
    @Published  var countriesData = [Country]()
    @Published private(set) var continents = [String]()   
    @Published  var originalCountriesData = [Country]()
    override init () {
        super.init()
        self.getAllCountriesData()
    }
    
    private func getAllCountriesData() {
        dataManager.getAllCountriesData().combineLatest(dataManager.getSubscribedCountries()).sink { [weak self] (error) in
            self?.originalCountriesData = [Country]()
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
            self.originalCountriesData = combinedResult
            self.countriesData = combinedResult
        }.store(in: &subscriptions)
    }
    
    func filterCountries(filter: String) {
        if filter == continentsKeys[0] {
            countriesData = originalCountriesData
        } else {
            countriesData = originalCountriesData.filter { country in
                country.continent == continentsKeysMapping[filter]
            }
        }
    }
    
    func searchCountries(matches keyword: String, filter: String) {
        filterCountries(filter: filter)
        if !keyword.isEmpty {
            countriesData = originalCountriesData.filter{ country in
                country.country?.lowercased().contains(keyword.lowercased()) ?? false
            }            
        }
    }
}
