//
//  SelectionIndicator.swift
//  BarGraph
//
//  Created by Yahia Ewida on 12/29/20.
//

import SwiftUI

import SwiftUI
import BarChart

struct SelectionIndicator: View {
    let entry: ChartDataEntry
    let location: CGFloat
    let infoRectangleColor: Color
    let infoRectangleWidth: CGFloat = 70
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                RoundedRectangle(cornerRadius: 3.0)
                    .foregroundColor(self.infoRectangleColor)
                VStack(alignment: .leading) {
                    HStack(alignment: .bottom, spacing: 2) {
                        Text("\(Int(self.entry.y))").font(.headline).fontWeight(.bold)
                            .foregroundColor(.gray).fontWeight(.bold)
                    }
                    Text(self.entry.x)
                        .font(.footnote).foregroundColor(.gray).fontWeight(.bold)
                }
            }
            .frame(width: self.infoRectangleWidth)
            .offset(x: self.positionX(proxy, location: self.location))            
            .id(UUID())
        }
    }
    
    func positionX(_ proxy: GeometryProxy, location: CGFloat) -> CGFloat {
        let selectorCentre = self.infoRectangleWidth / 2
        let startX = location - selectorCentre
        if startX < 0 {
            return 0
        } else if startX + self.infoRectangleWidth > proxy.size.width {
            return proxy.size.width - self.infoRectangleWidth
        } else {
            return startX
        }
    }
}


