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
    
     func makeOnboardingViews() -> [PageViewContent] {
        
        return [
            PageViewContent(
                model: PageViewContentModel(
                    image: Image("01"),
                    title: Text(verbatim: "Handwashing"),
                    description: Text(verbatim: "Rub hands together and scrub everywhere."))
            ), PageViewContent(
                model: PageViewContentModel(
                    image: Image("02"),
                    title: Text(verbatim: "Face Mask"),
                    description: Text(verbatim: "Wearing a face mask in public helps prevent the spread of COVID-19"))
            ), PageViewContent(
                model: PageViewContentModel(
                    image: Image("04"),
                    title: Text(verbatim: "Home insulation"),
                    description: Text(verbatim: "Stay at home for 14 days if you feel sick"))
            )
        ]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
