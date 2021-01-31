//
//  CountryDetailsView.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/27/20.
//

import SwiftUI
import SwiftUICharts


struct CountryDetailsView: View {
    @ObservedObject var viewModel: CountryDetailsViewModel
    @State private var selectedStatistics = "Country"
    @State private var selectedTime = ""
    @State var country: Country
    
    
    var body: some View {
        let subscriptionsView =  AnyView( Button(action: {
            
            if (country.isSubscribed ?? false) {
                viewModel.removeSubscription(from: country)
            } else {
                viewModel.subscribeTo(country: country)
            }
            
            country.isSubscribed = viewModel.isSubscriptionsDone
            
        }, label: {
            Image( (country.isSubscribed ?? false) ? "bell_subscribed" : "bell_unsubscribed")
        })
        )
        return GeometryReader { reader in
            DetailsView(countryName: country.country ?? "Empty", chartData: viewModel.getSortedByDayCasesArray(), reader: reader, cases: country.cases ?? 0, deaths: country.deaths ?? 0, recovered: country.recovered ?? 0, active: country.active ?? 0, critical: country.critical ?? 0, isSubscribed: (country.isSubscribed ?? false), subscriptionView: subscriptionsView)
        }
    }
}

struct CountryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailsView(viewModel: CountryDetailsViewModel(countryName: ""), country: Country())
    }
}

struct StatisticsSquare: View {
    var title: String
    var value: String
    var fillColor: Color
    
    var body: some View {
        ZStack (alignment: .topLeading) {
            Rectangle()
                .fill(fillColor)
                .cornerRadius(10)
            
            Text(title)
                .foregroundColor(.white)
                .padding(15)
            
            Text(value)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .font(.title2)
                .foregroundColor(.white)
                .padding([.top],60)
                .padding([.leading, .trailing])
        }
    }
}
