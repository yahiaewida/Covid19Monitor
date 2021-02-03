//
//  BindableResults.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 1/5/21.
//

import Foundation
import RealmSwift

class BindableResults<Element>: ObservableObject where Element: RealmCollectionValue {

    var results: Results<Element>
    private var token: NotificationToken!

    init(results: Results<Element>) {
        self.results = results
        lateInit()
    }

    func lateInit() {
        token = results.observe { [weak self] _ in
            self?.objectWillChange.send()
        }
    }

    deinit {
        token.invalidate()
    }
}

