//
//  DetailsView.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 1/12/21.
//

import SwiftUI
import SwiftUICharts

struct DetailsView: View {
    var countryName: String
    var chartData: [Double]
    var reader: GeometryProxy
    var cases: Int64
    var deaths: Int64
    var recovered: Int64
    var active: Int64
    var critical: Int64
    var isSubscribed: Bool
    var isSubscriptionRequired : Bool = true
    var subscriptionView:  AnyView = AnyView(EmptyView())
    
    @Environment(\.presentationMode) private var presentationMode
    
    
    var body: some View {
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
                        
                        Text(countryName)
                            .lineLimit(1)
                            .minimumScaleFactor(0.7)
                            .foregroundColor(.white)
                            .font(.title)
                            .truncationMode(.tail)
                        
                        Spacer()
                        
                        if isSubscriptionRequired {
                            subscriptionView
                        }
                        
                    }
                    .padding([.leading, .trailing], 20)
                    
                    HStack {
                        StatisticsSquare(title: "Affected", value: String(cases), fillColor: Color.orange)
                        
                        StatisticsSquare(title: "Deathes", value: String(deaths), fillColor: Color.lightRed)
                    }
                    .frame(height: 120)
                    .padding([.leading, .trailing])
                    
                    
                    HStack {
                        StatisticsSquare(title: "Recovered", value: String(recovered), fillColor: Color.lightGreen)
                        
                        StatisticsSquare(title: "Active", value: String(active), fillColor: Color.lightBlue)
                        
                        StatisticsSquare(title: "Critical", value: String(critical), fillColor: Color.customizedPurple)
                    }
                    .frame(height: 120)
                    .padding([.leading, .trailing])
                    .padding([.top, .bottom], 5)
                    
                    
                    LineChartView(data: chartData , title: "Daily Cases Statistics", form: CGSize(width: reader.size.width > 20 ? reader.size.width - 20 : reader.size.width, height: 200),rateValue: 0,valueSpecifier: "%.0f")
                        .padding([.leading, .trailing], 10)
                        .padding([.top, .bottom], 20)
                }
            }            
            .padding([.top],15)
        }
    }
}
