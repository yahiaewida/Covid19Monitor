//
//  BarChartView.swift
//  BarChart
//
//  Copyright (c) 2020 Roman Baitaliuk
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.

import SwiftUI

public struct SelectableBarChartView<SelectionView: View> : View {
    @ObservedObject var config: ChartConfiguration
    @State var xAxis = XAxis()
    @State var yAxis = YAxis()
    @State var selectionCallback: ((ChartDataEntry, CGPoint) -> Void)?
    var selectionView: SelectionView?
    
    public init(config: ChartConfiguration) {
        self.config = config
    }
    
    init(config: ChartConfiguration,
         selectionCallback: ((ChartDataEntry, CGPoint) -> Void)? = nil,
         selectionView: SelectionView? = nil) {
        self.init(config: config)
        self._selectionCallback = State(wrappedValue: selectionCallback)
        self.selectionView = selectionView
    }
    
    public var body: some View {
        ZStack {
            GeometryReader { proxy in
                CoordinateSystemView(yAxis: self.yAxis,
                                     xAxis: self.xAxis,
                                     frameSize: proxy.size).id(UUID())
                    .onReceive(self.config.objectWillChange) { _ in
                        self.yAxis = YAxis(frameHeight: self.yAxisHeight(proxy.size.height),
                                           data: self.config.data.yValues,
                                           ref: self.config.yAxis,
                                           labelsCTFont: self.config.labelsCTFont)
                        self.xAxis = XAxis(frameWidth: proxy.size.width - self.yAxis.maxLabelWidth,
                                           data: self.config.data.entries,
                                           ref: self.config.xAxis,
                                           labelsCTFont: self.config.labelsCTFont)
                    }
                self.selectionView
                BarChartCollectionView(yAxis: self.yAxis,
                                       xAxis: self.xAxis,
                                       gradient: self.config.data.gradientColor?.gradient(),
                                       color: self.config.data.color,
                                       selectionCallback: self.$selectionCallback)                    
            }
        }
    }
    
    private func yAxisHeight(_ frameHeight: CGFloat) -> CGFloat {
        let labelsHeight = String().height(ctFont: self.config.labelsCTFont)
        let topPadding = labelsHeight / 2
        let bottomPadding = labelsHeight  * 1.5
        return frameHeight - (topPadding + bottomPadding)
    }
}
