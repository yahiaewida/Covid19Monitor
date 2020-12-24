//
//  WorldStatisticsView.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/24/20.
//

import SwiftUI

struct WorldStatisticsView: View {
    var body: some View {
        GeometryReader { reader in
            VStack {
                worldStatisticsView(reader: reader)
                
                Text("Countries Statistics")
                    .padding()
                
                CoutriesStatisticsView(countries: [Country(updated: 5, country: "1", continent: "2", cases: 2, todayCases: 1, deaths: 3, todayDeaths: 4, recovered: 5, active: 6, critical: 6, casesPerOneMillion: 7, deathsPerOneMillion: 8, tests: 9, testsPerOneMillion: 19, isSubscribed: false)])
            }
        }
        .padding()        
    }
    
    func worldStatisticsView(reader: GeometryProxy) -> some View {
        let upperHeader = Text("World Statistics")
            .foregroundColor(.white)
            .font(.title)
            .bold()
            .padding([.top, .trailing, .leading])
            .padding([.bottom], 5)
        
        return StatisticsHeaderView(reader: reader,backgroundColor: Color.blue, fontColor: Color.white, upperHeader: upperHeader, isShadowRequired: true, height: 160)
    }
}

struct WorldStatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        WorldStatisticsView()
    }
}
