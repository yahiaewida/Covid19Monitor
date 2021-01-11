//
//  CoutriesStatisticsView.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/24/20.
//

import SwiftUI

struct CoutriesStatisticsView: View {
    @ObservedObject private var viewModel = CountriesViewModel()
    var body: some View {
        
        GeometryReader { reader in
            List {
                ForEach(viewModel.countriesData.prefix(5), id: \.country) { country in
                    NavigationLink(destination: CountryDetailsView(viewModel: CountryDetailsViewModel(countryName: country.country ?? ""), country: country)) {
                         getCountryStatisticsView(reader: reader, country: country)
                            .listRowInsets(EdgeInsets())
                    }
                    .navigationBarTitle("", displayMode: .inline)
                }
            }
            .listStyle(PlainListStyle())
            .frame(width: reader.size.width)
        }
    }
    
    private func getCountryStatisticsView(reader : GeometryProxy,country: Country) -> some View {
        let upperHeader = HStack(alignment:.center) {
            Text(country.country ?? "")
                .foregroundColor(.primary)
                .font(Font.system(size: 22))
                .bold()
        }
        .padding([.top,.bottom],5)
        
        
        return StatisticsHeaderView(reader: reader, backgroundColor: Color.lightGray, fontColor: Color.black.opacity(0.8), upperHeader:upperHeader , height: 130,confirmed: country.cases ?? 0, recovered: country.recovered ?? 0, deaths: country.deaths ?? 0, widthOffset: CGFloat(50))
    }
}


struct CoutriesStatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        CoutriesStatisticsView()
    }
}
