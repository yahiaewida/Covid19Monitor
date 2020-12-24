//
//  MainTabView.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/24/20.
//

import SwiftUI
import Combine

struct MainTabView: View {
    @State var text: String = ""
    var body: some View {
      
        TabView {
            WorldStatisticsView()
                .tabItem {
                    Image(systemName: "square.stack.fill")
                    Text(verbatim: "Books")
                }.tag(0)
        }
                
    }
    
    
    
    func test() {
        let publisher = DataManager().getAllStatistics()
        publisher.subscribe(on: DispatchQueue.main).sink { (error) in
            text = "error"
        } receiveValue: { (statistics) in
            text = String(statistics.deaths)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
