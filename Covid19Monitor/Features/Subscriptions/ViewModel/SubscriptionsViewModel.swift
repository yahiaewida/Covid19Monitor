//
//  SubscriptionsViewModel.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 1/5/21.
//

import Foundation
import RealmSwift

class SubscriptionsViewModel: BaseViewModel , ObservableObject {
    @Published var countriesData: [Country] = [Country]()
    private var countriesToken: NotificationToken?
    
    override init() {
        super.init()
        getSubscribedCountries()
    }
    
    private func getSubscribedCountries() {
        dataManager.getSubscribedCountries().sink { [weak self] (error) in
            self?.countriesData = [Country]()
            self?.isLoading = false
        } receiveValue: { [weak self ](countries) in
            guard let self = self else { return }
            self.isLoading = false
            self.countriesData = countries            
        }.store(in: &subscriptions)
    }
    
    deinit {
        countriesToken?.invalidate()
    }
}
