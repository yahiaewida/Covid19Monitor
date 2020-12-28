//
//  CountryDetailsView.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/27/20.
//

import SwiftUI
//import Graphs

struct CountryDetailsView: View {
    @State private var selectedStatistics = "My Country"
    @State private var selectedTime = ""
    private var test = ["My Country", "Global"]
    
    init() {
        
        
        
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white,.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(cgColor: Color.lightPurple.cgColor!),.font: UIFont.systemFont(ofSize: 16)], for: .selected)
        UISegmentedControl.appearance().backgroundColor = UIColor(cgColor: Color.lightPurple.cgColor!)
        
    }
    
    var body: some View {
        GeometryReader { reader in
            ZStack (alignment:.leading){
                Rectangle()
                    .fill(Color.darkPurple)

                ScrollView {
                    VStack(alignment:.center) {
                        
                        HStack {
                            Text("Egypt Statistics")
                                .lineLimit(1)
                                .minimumScaleFactor(0.7)
                                .foregroundColor(.white)
                                .font(.title)
                                .truncationMode(.tail)
                            
                            Spacer()
                            Image("bell_unsubscribed")
                        }
                        .padding([.leading, .trailing], 20)
                        
                            
                        Picker("Filter",selection: $selectedStatistics) {
                            ForEach(test, id: \.self) { test in
                                Text(test).tag(test)
                            }
                        }
                        .padding()
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: UIScreen.main.bounds.width - 50)
                        .scaledToFill()
                        
                        
                        HStack {
                            StatisticsSquare(title: "Affected", value: "3233123", fillColor: Color.orange)
                            
                            StatisticsSquare(title: "Deathes", value: "3233123", fillColor: Color.lightRed)
                        }
                        .frame(height: 120)
                        .padding([.leading, .trailing])
                        
                        
                        HStack {
                            StatisticsSquare(title: "Recovered", value: "3233123", fillColor: Color.lightGreen)
                            
                            StatisticsSquare(title: "Active", value: "3233123", fillColor: Color.lightBlue)
                            
                            StatisticsSquare(title: "Serious", value: "3233123", fillColor: Color.customizedPurple)
                        }
                        .frame(height: 120)
                        .padding([.leading, .trailing])
                        .padding([.top, .bottom], 5)
                        
                    }
                }.padding([.top], 50)
            }
            .ignoresSafeArea()
        }
        
    }
}

struct CountryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailsView()
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
