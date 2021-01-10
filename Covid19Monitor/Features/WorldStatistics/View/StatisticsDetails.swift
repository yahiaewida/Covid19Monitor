//
//  StatisticsDetails.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 1/10/21.
//

import SwiftUI
import SunburstDiagram

struct StatisticsDetails: View {
    
    let configuration = SunburstConfiguration(nodes: [
        Node(name: "Active", value: 10.0, backgroundColor: UIColor(Color.lightBlue)),
        Node(name: "Death", value: 10.0, backgroundColor:  UIColor(Color.red)),
        Node(name: "Recovered", value: 30.0, backgroundColor:  UIColor(Color.lightGreen)),
        Node(name: "Critical", value: 50.0, backgroundColor:  UIColor(Color.lightRed))
    ])
    init () {
        configuration.allowsSelection = false
        configuration.innerRadius = 80
    }
    
    var body: some View {
        SunburstView(configuration: configuration)
            .foregroundColor(.white)
            .font(Font.system(size: 15))
    }
}

struct StatisticsDetails_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsDetails()
    }
}
