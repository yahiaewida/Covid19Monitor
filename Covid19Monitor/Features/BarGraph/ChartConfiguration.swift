//
//  ChartConfiguration.swift
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
import Combine

public class ChartConfiguration: ObservableObject {
    @Published public var data = ChartData()
    public var xAxis = XAxisReference()
    public var yAxis = YAxisReference()
    
    private var xAxisCancellable: AnyCancellable?
    private var yAxisCancellable: AnyCancellable?
    
    static let defaultLabelsCTFont = CTFontCreateWithName(("SFProText-Regular" as CFString), 12, nil)
    @Published public var labelsCTFont: CTFont = ChartConfiguration.defaultLabelsCTFont
    
    public init() {
        self.xAxisCancellable = self.xAxis.objectWillChange.sink(receiveValue: { _ in
            self.objectWillChange.send()
        })
        
        self.yAxisCancellable = self.yAxis.objectWillChange.sink(receiveValue: { _ in
            self.objectWillChange.send()
        })
    }
}
