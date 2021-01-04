//
//  WorldStatisticsViewModel.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/28/20.
//

import Foundation
import Combine

class WorldStatisticsViewModel: BaseViewModel, ObservableObject {
    private let dataManager = DataManager()
    @Published private(set) var worldStatistics = Statistics()
    
    override init () {
        super.init()
        self.getAllStatistics()
    }
    private func getAllStatistics(){
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
}
