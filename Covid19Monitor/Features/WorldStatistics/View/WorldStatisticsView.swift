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
    
    var body: some View {
        NavigationView {
            GeometryReader { reader in
                VStack {
                    if viewModel.isLoading {
                        ProgressView()
                    } else {
                        NavigationLink(destination: StatisticsDetailsView()) {
                            worldStatisticsView(reader: reader)
                        }
                        
                        Text("Top 5 Countries")
                            .font(.title)
                            .padding()
                                               
                        CoutriesStatisticsView()
                    }
                }
            }
        }
    }
    
    func worldStatisticsView(reader: GeometryProxy) -> some View {        
        return StatisticsHeaderView(reader: reader,backgroundColor: Color.darkPurple, fontColor: Color.white, upperHeader: "World Statistics", isWorldStatistics: true, height: 160, confirmed: viewModel.worldStatistics.cases , recovered: viewModel.worldStatistics.recovered , deaths: viewModel.worldStatistics.deaths)
    }
}

struct WorldStatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        WorldStatisticsView()
    }
}
