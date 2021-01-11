//
//  StatisticsDetails.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 1/10/21.
//

import SwiftUI
import Charts

struct StatisticsDetails: View {
    
    var body: some View {
        GeometryReader { reader in
            
            ScrollView(.vertical , showsIndicators: false) {
                VStack {
                    
                    Text("World Statistics")
                        .font(.title)
                    
                    HStack {
                        StatisticsSquare(title: "Recovered", value: String(213123), fillColor: Color.lightGreen)
                        
                        StatisticsSquare(title: "Active", value: String(3213213), fillColor: Color.lightBlue)
                        
                        StatisticsSquare(title: "Deaths", value: String(321332), fillColor: Color.lightRed)
                    }
                    .padding([.leading, .trailing], 10)
                    .frame(width: reader.size.width , height: 120)
                    .padding([.top, .bottom], 5)
                    
                    
                    PieChart(entries: [PieChartDataEntry(value: 23918513, label: "Active"), PieChartDataEntry(value: 90777731, label: "Cases") , PieChartDataEntry(value: 64914393, label: "Recovered"), PieChartDataEntry(value: 1944825, label: "Deaths")])
                        .frame(width: reader.size.width ,height: 300)
                        .font(Font.system(size: 12))
                    
                }
                .padding([.top],20)
            }.frame(width: reader.size.width)
            
        }
    }
}

struct StatisticsDetails_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsDetails()
    }
}
