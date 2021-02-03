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
        NavigationView {
            GeometryReader { reader in
                List {
                    ForEach(viewModel.countriesData, id: \.country) { country in
                        NavigationLink(destination: CountryDetailsView(viewModel: CountryDetailsViewModel(countryName: country.country ?? ""), country: country)) {
                             getCountryStatisticsView(reader: reader, country: country)
                                .listRowInsets(EdgeInsets())
                        }
                        .navigationBarTitle("", displayMode: .inline)
                    }.onDelete(perform: removeSubscription)
                }
                .listStyle(PlainListStyle())
                .frame(width: reader.size.width)
            }
        }
    }
    
    private func removeSubscription(at indexSet: IndexSet) {
        viewModel.removeSubscription(from: viewModel.countriesData[Int(indexSet.first ?? 0)])
    }
    
    private func getCountryStatisticsView(reader : GeometryProxy,country: Country) -> some View {
        let upperHeader = HStack(alignment:.center) {
            Text(country.country ?? "")
                .foregroundColor(.primary)
                .font(Font.system(size: 22))
                .bold()
        }
        .padding([.top,.bottom],5)
        
        return StatisticsHeaderView(reader: reader, backgroundColor: Color.lightGray, fontColor: Color.black.opacity(0.8), upperHeader: country.country ?? "" , height: 130,confirmed: country.cases ?? 0, recovered: country.recovered ?? 0, deaths: country.deaths ?? 0, widthOffset: CGFloat(50))
    }
}

struct SubscriptionsView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionsView()
    }
}
