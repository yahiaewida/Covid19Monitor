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


final class ChannelsData: ObservableObject {
    @Published var channels: [CountryRealm]
    private var channelsToken: NotificationToken?
    
    // Grab channels from Realm, and then activate a Realm token to listen for changes.
    init() {
        let realm = try! Realm()
        channels = Array(realm.objects(CountryRealm.self)) // Convert Realm results object to Array
        activateChannelsToken()
    }
    
    private func activateChannelsToken() {
        let realm = try! Realm()
        let channels = realm.objects(CountryRealm.self)
        channelsToken = channels.observe { _ in
            // When there is a change, replace the old channels array with a new one.
            self.channels = Array(channels)
        }
    }
    
    deinit {
        channelsToken?.invalidate()
    }
}
