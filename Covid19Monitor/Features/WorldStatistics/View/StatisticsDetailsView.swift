//
//  StatisticsDetailsView.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 1/10/21.
//

import SwiftUI
import Charts

struct StatisticsDetailsView: View {
    @ObservedObject private var viewModel = WorldStatisticsViewModel()
    
    var body: some View {
        
        
        GeometryReader { reader in
            ScrollView {
                
                ZStack (alignment:.leading){
                    Rectangle()
                        .fill(Color.darkPurple)
                        .ignoresSafeArea()
                    
                    VStack {
                        DetailsView(countryName: "World Statistics", chartData: viewModel.worldStatisticsDetails.getSortedByDayCasesArray(), reader: reader, cases: viewModel.worldStatistics.cases , deaths: viewModel.worldStatistics.deaths, recovered: viewModel.worldStatistics.recovered, active: viewModel.worldStatistics.active, critical: viewModel.worldStatistics.critical, isSubscribed: false, isSubscriptionRequired: false)
                        
                        PieChart(entries: [PieChartDataEntry(value: 23918513, label: "Active"), PieChartDataEntry(value: 90777731, label: "Cases") , PieChartDataEntry(value: 64914393, label: "Recovered"), PieChartDataEntry(value: 1944825, label: "Deaths")])
                            .frame(width: reader.size.width ,height: 300)
                            .font(Font.system(size: 12))
                        
                    }
                    .padding([.top],20)
                }
                
            }.frame(width: reader.size.width)
            
        }
    }
}

struct StatisticsDetails_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsDetailsView()
    }
}
