//
//  BaseViewModel.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/28/20.
//

import Foundation
import Combine

class BaseViewModel {
    var subscriptions: [AnyCancellable] = []
    @Published var isLoading = true
    
    deinit {
        subscriptions.removeAll()
    }
}
