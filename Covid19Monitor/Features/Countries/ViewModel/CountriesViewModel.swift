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
    
    override init () {
        super.init()
        self.getAllCourntriesData()
    }
    private func getAllCourntriesData(){
        dataManager.getAllCountriesData().sink { (error) in
            self.countriesData = [Country]()
        } receiveValue: { (countries) in
            self.countriesData = countries.sorted{ country1 , country2 in
                return country1.cases ?? 0 >= country2.cases ?? 0
            }
        }.store(in: &subscriptions)
    }
}
