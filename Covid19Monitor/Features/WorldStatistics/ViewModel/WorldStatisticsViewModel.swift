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
        dataManager.getAllStatistics().sink { (error) in
            self.worldStatistics = Statistics()
        } receiveValue: { (statistics) in
            self.worldStatistics = statistics
        }.store(in: &subscriptions)
    }
}
