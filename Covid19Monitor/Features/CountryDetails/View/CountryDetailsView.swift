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
    @Environment(\.presentationMode) private var presentationMode

    //    init() {
//        UISegmentedControl.appearance().selectedSegmentTintColor = .white
//        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white,.font: UIFont.systemFont(ofSize: 16)], for: .normal)
//        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(cgColor: Color.lightPurple.cgColor!),.font: UIFont.systemFont(ofSize: 16)], for: .selected)
//        UISegmentedControl.appearance().backgroundColor = UIColor(cgColor: Color.lightPurple.cgColor!)
//        UIScrollView.appearance().bounces = false
//    }
    
    var body: some View {
        return GeometryReader { reader in
            ZStack (alignment:.leading){
                Rectangle()
                    .fill(Color.darkPurple)
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators:false) {
                    VStack(alignment:.center) {
                        
                        HStack {
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Image(systemName: "chevron.backward")
                                    .foregroundColor(Color.white)                                    
                            })
                            .padding([.trailing],10)
                            
                            Text(country.country ?? "Empty")
                                .lineLimit(1)
                                .minimumScaleFactor(0.7)
                                .foregroundColor(.white)
                                .font(.title)
                                .truncationMode(.tail)
                                
                            
                            Spacer()
                            Image((country.isSubscribed ?? false) ? "bell_subscribed" : "bell_unsubscribed")
                        }
                        .padding([.leading, .trailing,[.bottom]], 20)

                            
//                        Picker("Filter",selection: $selectedStatistics) {
//                            ForEach(test, id: \.self) { test in
//                                Text(test).tag(test)
//                            }
//                        }
//                        .padding()
//                        .pickerStyle(SegmentedPickerStyle())
//                        .frame(width: UIScreen.main.bounds.width - 50)
//                        .scaledToFill()
//
                        
                        HStack {
                            StatisticsSquare(title: "Affected", value: String(country.cases ?? 0), fillColor: Color.orange)
                            
                            StatisticsSquare(title: "Deathes", value: String(country.deaths ?? 0), fillColor: Color.lightRed)
                        }
                        .frame(height: 120)
                        .padding([.leading, .trailing])
                        
                        
                        HStack {
                            StatisticsSquare(title: "Recovered", value: String(country.recovered ?? 0), fillColor: Color.lightGreen)
                            
                            StatisticsSquare(title: "Active", value: String(country.active ?? 0), fillColor: Color.lightBlue)
                            
                            StatisticsSquare(title: "Critical", value: String(country.critical ?? 0), fillColor: Color.customizedPurple)
                        }
                        .frame(height: 120)
                        .padding([.leading, .trailing])
                        .padding([.top, .bottom], 5)
                        
                                                
                        LineChartView(data: viewModel.getSortedByDayCasesArray(), title: "Daily Cases Statistics", form: CGSize(width: reader.size.width > 20 ? reader.size.width - 20 : reader.size.width, height: 200),rateValue: 0,valueSpecifier: "%.0f")
                                .padding([.leading, .trailing], 10)
                                .padding([.top, .bottom], 20)
                        
                        
                    }
                }
                
                .padding([.top],15)
            }
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
                .lineLimit(2)
                .minimumScaleFactor(0.7)
                .font(.title2)
                .foregroundColor(.white)
                .padding([.top],60)
                .padding([.leading, .trailing])
            
        }
    }
}
