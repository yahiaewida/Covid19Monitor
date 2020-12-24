//
//  CoutriesStatisticsView.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/24/20.
//

import SwiftUI

struct CoutriesStatisticsView: View {
    
    var countries: [Country]
    
    var body: some View {
        GeometryReader { reader in
            ScrollView {
               
                
                getCountryStatisticsView(reader: reader)
                getCountryStatisticsView(reader: reader)
                getCountryStatisticsView(reader: reader)
                getCountryStatisticsView(reader: reader)
                getCountryStatisticsView(reader: reader)
            }
            .frame(width: reader.size.width)
            .listStyle(InsetListStyle())
        }
                
    }
    
    
    private func getCountryStatisticsView(reader : GeometryProxy) -> some View {
        
        let upperHeader = HStack {
            Image("eg")
                .resizable()
                .renderingMode(.original)
                .frame(width: 20,height: 20)
                .padding(5)
                
            
            Text("Egypt")
        }
        
        return StatisticsHeaderView(reader: reader, backgroundColor: Color.gray, fontColor: Color.black, upperHeader:upperHeader , height: 120)
    }
}



struct CoutriesStatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        CoutriesStatisticsView(countries: [Country(updated: 5, country: "1", continent: "2", cases: 2, todayCases: 1, deaths: 3, todayDeaths: 4, recovered: 5, active: 6, critical: 6, casesPerOneMillion: 7, deathsPerOneMillion: 8, tests: 9, testsPerOneMillion: 19, isSubscribed: false)])
    }
}
