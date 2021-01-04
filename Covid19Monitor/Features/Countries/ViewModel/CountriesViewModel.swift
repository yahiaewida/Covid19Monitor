//
//  CountriesViewModel.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/28/20.
//


import Foundation
import Combine

class CountriesViewModel: BaseViewModel, ObservableObject {
    private let dataManager = DataManager()
    @Published private(set) var countriesData = [Country]()
    @Published private(set) var continents = [String]()   
    
    override init () {
        super.init()
        self.getAllCourntriesData()
    }
    
    private func getAllCourntriesData(){
        dataManager.getAllCountriesData().sink { [weak self] (error) in
            self?.countriesData = [Country]()
            self?.isLoading = false
        } receiveValue: { [weak self ](countries) in
            guard let self = self else { return }
            self.isLoading = false
            self.countriesData = countries
            self.continents = Array<String>(Set(countries.map { ($0.continent ?? "") }))
            
        }.store(in: &subscriptions)
    }
}
