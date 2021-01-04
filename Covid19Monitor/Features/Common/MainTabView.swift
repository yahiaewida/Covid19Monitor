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
        
        
        PagesView(self.makeOnboardingViews())
            
//        TabView {
//            WorldStatisticsView()
//                .tabItem {
//                    Image(systemName: "square.stack.fill")
//                    Text(verbatim: "World Statistics")
//                }.tag(1)
//
//            CountriesView()
//                .tabItem {
//                    Image(systemName: "square.stack.fill")
//                    Text(verbatim: "Countries")
//                }.tag(0)
//        }
        
    }
    
    func test() {
        let publisher = DataManager().getAllStatistics()
        publisher.subscribe(on: DispatchQueue.main).sink { (error) in
            text = "error"
        } receiveValue: { (statistics) in
            text = String(statistics.deaths)
        }
        
    }
    
     func makeOnboardingViews() -> [PageViewContent] {
        
        return [
            PageViewContent(
                model: PageViewContentModel(
                    image: Image("01"),
                    title: Text(verbatim: "Title"),
                    description: Text(verbatim: "subtitle and description"))
            ), PageViewContent(
                model: PageViewContentModel(
                    image: Image("02"),
                    title: Text(verbatim: "Title"),
                    description: Text(verbatim: "subtitle and description"))
            ), PageViewContent(
                model: PageViewContentModel(
                    image: Image("04"),
                    title: Text(verbatim: "Title"),
                    description: Text(verbatim: "subtitle and description"))
            )
        ]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
