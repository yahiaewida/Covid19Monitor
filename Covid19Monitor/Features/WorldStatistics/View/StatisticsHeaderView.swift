//
//  StatisticsHeaderView.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/24/20.
//

import SwiftUI

struct StatisticsHeaderView <Header: View>: View  {
    var reader : GeometryProxy
    var backgroundColor: Color
    var fontColor: Color
    var upperHeader: Header
    var isShadowRequired = false
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
                .shadow(radius: isShadowRequired ? 10 : 0)
                .frame(width:reader.size.width > 0 ? reader.size.width - widthOffset : reader.size.width, height: height)
            
            VStack {
               upperHeader
                
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
    
    private func getStatisticsSubHeaderView(title:String , value: Int64) -> some View{
        VStack {
            Text(title)
                .bold()
            Text(String(value))
                .padding(5)
        }
    }
}


struct StatisticsHeaderView_Previews: PreviewProvider {
    static let upperHeader : some View = HStack(alignment:.center) {
        Spacer()
        Text("Egypt")
            .font(Font.system(size: 22))
            .bold()
        Spacer()
        
        Image("bell_unsubscribed")
            .padding([.trailing],50)
            .padding([.top],5)
            .frame(width: 20, height: 20)
    }
    .padding([.top],5)
    
    static var previews: some View {
        GeometryReader { reader in
            StatisticsHeaderView(reader: reader, backgroundColor: Color.lightGray, fontColor: Color.primary, upperHeader: Text("Egypt") , height: 130,confirmed: 32323, recovered: 23232, deaths: 2323)
        }
    }
}
