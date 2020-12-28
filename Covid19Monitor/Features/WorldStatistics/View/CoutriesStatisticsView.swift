//
//  CoutriesStatisticsView.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/24/20.
//

import SwiftUI
import Kingfisher


struct CoutriesStatisticsView: SwiftUI.View {
    @ObservedObject private var viewModel = CountriesViewModel()
    //@State private var image = UIImage(named: "eg")
    var body: some SwiftUI.View {
        GeometryReader { reader in
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.countriesData, id: \.country) { country in
                    getCountryStatisticsView(reader: reader, country: country)
                }
            }
            .frame(width: reader.size.width)
            .listStyle(InsetListStyle())
        }
                
    }
    
    private func getCountryStatisticsView(reader : GeometryProxy,country: Country) -> some SwiftUI.View {
        //loadImage(url: country.countryInfo?.flag ?? "")
        
        let upperHeader = HStack(alignment:.center) {
//            Image(uiImage: image ?? UIImage())
//                .resizable()
//                .renderingMode(.original)
//                .frame(width: 20,height: 20)
//                .padding(5)
                
            Text(country.country ?? "")
                .font(Font.system(size: 22))
                .bold()
                
//            Image((country.isSubscribed ?? false) ? "bell_subscribed" : "bell_unsubscribed")
//                .padding([.top],5)
//                .frame(width: 15, height: 15)
        }
        .padding([.top,.bottom],5)
        
        
        return StatisticsHeaderView(reader: reader, backgroundColor: Color.lightGray, fontColor: Color.black.opacity(0.8), upperHeader:upperHeader , height: 130,confirmed: country.cases ?? 0, recovered: country.recovered ?? 0, deaths: country.deaths ?? 0)
    }
    
//    private func loadImage(url:String) {
//        guard let imageURL = URL(string: url) else { return }
//        KingfisherManager.shared.retrieveImage(with: imageURL) { result in
//            switch result {
//            case .success(let imageResult):
//                withAnimation(.easeIn) {
//                    self.image = imageResult.image
//                }
//            case .failure:
//                break
//            }
//        }
//    }
}


struct CoutriesStatisticsView_Previews: PreviewProvider {
    static var previews: some SwiftUI.View {
        CoutriesStatisticsView()
    }
}
