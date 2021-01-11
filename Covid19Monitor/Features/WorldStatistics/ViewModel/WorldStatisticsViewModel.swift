//
//  WorldStatisticsViewModel.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/28/20.
//

import Foundation
import Combine

class WorldStatisticsViewModel: BaseViewModel, ObservableObject {
    @Published private(set) var worldStatistics = Statistics()
    @Published private(set) var worldStatisticsDetails = Timeline()
    
    override init () {
        super.init()
        self.getAllStatistics()
        self.getStatisticsDetails()
    }
    
    private func getAllStatistics() {
        dataManager.getAllStatistics().sink { [weak self] (error) in
            guard let self = self else { return }
            self.worldStatistics = Statistics()
            self.isLoading = false
        } receiveValue: { [weak self] (statistics) in
            guard let self = self else { return }
            self.worldStatistics = statistics
            self.isLoading = false
        }.store(in: &subscriptions)
    }
    
    private func getStatisticsDetails() {
        dataManager.getWorldDetails().sink { [weak self] (error) in
            guard let self = self else { return }
            self.worldStatisticsDetails = Timeline()
            self.isLoading = false
        } receiveValue: { [weak self] (statisticsDetails) in
            guard let self = self else { return }
            self.worldStatisticsDetails = statisticsDetails
            self.isLoading = false
        }.store(in: &subscriptions)
    }
}
