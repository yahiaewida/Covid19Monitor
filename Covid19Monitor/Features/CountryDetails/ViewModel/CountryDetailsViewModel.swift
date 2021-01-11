//
//  CountryDetailsViewModel.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 1/3/21.
//


import Foundation
import Combine

class CountryDetailsViewModel: BaseViewModel, ObservableObject {
    @Published private(set) var countryDetails = CountryDetails()
    @Published private(set) var isSubscriptionsDone = false
    
    init (countryName name: String) {
        super.init()
        if !name.isEmpty {
            self.getCountryDetails(countryName: name)
        }
    }
    
    func subscribeTo(country: Country) {
        isSubscriptionsDone = dataManager.addSubscribedCountry(country: country.toRealmObject())
    }
    
    func removeSubscription(from country: Country) {
        isSubscriptionsDone = !(dataManager.removeSubscribedCountry(country: country.toRealmObject()))
    }
    
    private func getCountryDetails(countryName name: String){
        dataManager.getCountryDetails(countryName: name).sink { [weak self] (error) in
            guard let self = self else { return }
            self.countryDetails = CountryDetails()
            self.isLoading = false
        } receiveValue: { [weak self] (countryDetails) in
            guard let self = self else { return }
            
            self.countryDetails = countryDetails
            self.isLoading = false
        }.store(in: &subscriptions)
    }
    
    func getSortedByDayCasesArray() -> [Double] {
        countryDetails.timeline.getSortedByDayCasesArray()
    }
}
