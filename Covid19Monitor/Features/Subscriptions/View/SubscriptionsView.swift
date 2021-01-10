//
//  SubscriptionsView.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 1/5/21.
//

import SwiftUI
import RealmSwift

struct SubscriptionsView: View {
    
    @ObservedObject private var viewModel = SubscriptionsViewModel()
    
    var body: some View {
        GeometryReader { reader in
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.countriesData, id: \.country) { country in
                    getCountryStatisticsView(reader: reader, country: country)
                }                
            }
            .frame(width: reader.size.width)
        }
    }
    
    private func getCountryStatisticsView(reader : GeometryProxy,country: Country) -> some View {
        
        let upperHeader = HStack(alignment:.center) {
            Text(country.country ?? "")
                .font(Font.system(size: 22))
                .bold()
        }
        .padding([.top,.bottom],5)
        
        return StatisticsHeaderView(reader: reader, backgroundColor: Color.lightGray, fontColor: Color.black.opacity(0.8), upperHeader:upperHeader , height: 130,confirmed: country.cases ?? 0, recovered: country.recovered ?? 0, deaths: country.deaths ?? 0)
    }
}

struct SubscriptionsView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionsView()
    }
}