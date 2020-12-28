//
//  WorldStatisticsView.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/24/20.
//

import SwiftUI

struct WorldStatisticsView: View {
    @ObservedObject private var viewModel = WorldStatisticsViewModel()
    @State private var selectedFilter = ""
    private var test = ["Europe", "Africa"]
    var body: some View {
        GeometryReader { reader in
            VStack {
                worldStatisticsView(reader: reader)
                
                Text("Countries Statistics")
                    .font(.title)
                    .padding()
            
                Picker("Filter",selection: $selectedFilter) {
                    ForEach(test, id: \.self) { test in
                        Text(test).tag(test)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding([.leading, .trailing, .bottom])
                
                CoutriesStatisticsView()
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
        
        return StatisticsHeaderView(reader: reader,backgroundColor: Color.darkPurple, fontColor: Color.white, upperHeader: upperHeader, isShadowRequired: true, height: 160, confirmed: viewModel.worldStatistics.cases , recovered: viewModel.worldStatistics.recovered , deaths: viewModel.worldStatistics.deaths)
    }
}

struct WorldStatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        WorldStatisticsView()
    }
}
