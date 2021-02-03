//
//  StatisticsHeaderView.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/24/20.
//

import SwiftUI

struct StatisticsHeaderView : View  {
    var reader : GeometryProxy
    var backgroundColor: Color
    var fontColor: Color
    var upperHeader: String
    var isWorldStatistics = false
    var height: CGFloat
    var confirmed: Int64
    var recovered: Int64
    var deaths: Int64
    var widthOffset : CGFloat = 20
    
    var body: some View {
        ZStack(alignment: .top){
            Rectangle()
                .fill(backgroundColor)
                .cornerRadius(20)
                .shadow(radius: isWorldStatistics ? 10 : 0)
                .frame(width:reader.size.width > 0 ? reader.size.width - widthOffset : reader.size.width, height: height)
            
            VStack {                
                getUpperHeaderView(text: upperHeader)
                
                Group {
                    HStack {
                        getStatisticsSubHeaderView(title: "Confirmed", value: confirmed)
                        Spacer()
                        getStatisticsSubHeaderView(title: "Recovered", value: recovered)
                        Spacer()
                        getStatisticsSubHeaderView(title: "Deaths", value: deaths)
                    }
                }
                .lineLimit(1)
                .truncationMode(.tail)
                .padding([.leading, .trailing])
                .padding([.top, .bottom],5)
                .font(Font.system(size: 20))
                .minimumScaleFactor(0.7)
                .foregroundColor(fontColor)
            }
        }
    }
    
    private func getUpperHeaderView(text: String) -> AnyView {
        if isWorldStatistics {
            return AnyView(
                Text(text)
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .padding([.top, .trailing, .leading])
                    .padding([.top])
                    .padding([.bottom], 5)
            )
        } else {
            return AnyView(
                Text(text)
                    .padding([.top], 5)
                    .font(Font.system(size: 20))
            )
        }
    }
    
    private func getStatisticsSubHeaderView(title:String , value: Int64) -> some View {
        VStack {
            Text(title)
                .bold()
            Text("\(value)")
                .padding(5)
        }
    }
}


struct StatisticsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { reader in
            StatisticsHeaderView(reader: reader, backgroundColor: Color.lightGray, fontColor: Color.primary, upperHeader: "Egypt" , height: 130,confirmed: 32323, recovered: 23232, deaths: 2323)
        }
    }
}
