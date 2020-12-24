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
    
    var body: some View {
        ZStack(alignment: .top){
            Rectangle()
                .fill(backgroundColor)
                .cornerRadius(20)
                .shadow(radius: isShadowRequired ? 10 : 0)
                .frame(width:reader.size.width, height: height)
            
            VStack {
               upperHeader
                
                Group {
                    HStack {
                        getStatisticsSubHeaderView(title: "Confirmed", value: "3213123")
                        Spacer()
                        getStatisticsSubHeaderView(title: "Recovered", value: "321313")
                        Spacer()
                        getStatisticsSubHeaderView(title: "Deaths", value: "3213133")
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
    
    private func getStatisticsSubHeaderView(title:String , value: String) -> some View{
        VStack {
            Text(title)
                .bold()
            Text(value)
                .padding(5)
        }
    }
}


//struct StatisticsHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        GeometryReader { reader in
//            StatisticsHeaderView(reader: reader)
//        }
//    }
//}
