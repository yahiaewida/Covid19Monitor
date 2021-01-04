//
//  ContentView.swift
//  BarGraph
//
//  Created by Yahia Ewida on 12/17/20.
//


import SwiftUI
import BarChart

struct BarGraphView: View {
    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    
    // MARK: - Chart Properties
    
    let chartHeight: CGFloat
    let config = ChartConfiguration()
    @State var entries = [ChartDataEntry(x: "test", y: 20), ChartDataEntry(x: "test2", y: 50), ChartDataEntry(x: "test2", y: 50), ChartDataEntry(x: "test2", y: 50), ChartDataEntry(x: "test2", y: 565650), ChartDataEntry(x: "test2", y: 50),ChartDataEntry(x: "test2", y: 323232), ChartDataEntry(x: "test2", y: 50)]
    @State var selectedBarTopCentreLocation: CGPoint?
    @State var selectedEntry: ChartDataEntry?
    
    // MARK: - Controls Properties
    
    @State var maxEntriesCount: Int = 2
    @State var xAxisTicksIntervalValue: Double = 1
    @State var isXAxisTicksHidden: Bool = true
    // MARK: - Views
    
   
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                self.chartView()
                self.controlsView()
                    .navigationBarTitle(Text("BarChart"))
            }
            .padding(5)
        }
    }
    
    func selectionIndicatorView() -> some View {
        Group {
            if self.selectedEntry != nil && self.selectedBarTopCentreLocation != nil {
                SelectionIndicator(entry: self.selectedEntry!,
                                   location: self.selectedBarTopCentreLocation!.x,
                                   infoRectangleColor: Color(red: 241/255, green: 242/255, blue: 245/255))
            } else {
                Rectangle().foregroundColor(.clear)
            }
        }
        .frame(height: 60)
    }
    
    func chartView() -> some View {
        return ZStack {
            // Drop shadow rectangle
            RoundedRectangle(cornerRadius: 40)
                .foregroundColor(.white)
                .padding([.bottom, .top])
                .shadow(color: .gray, radius: 5)
                Text("No data").opacity(self.entries.isEmpty ? 1.0 : 0.0)
            VStack(alignment: .leading, spacing: 0) {
                Text("Weekly Statistics")
                
                self.selectionIndicatorView()
                SelectableBarChartView<SelectionLine>(config: self.config)
                .onBarSelection { entry, location in
                    self.selectedBarTopCentreLocation = location
                    self.selectedEntry = entry
                }
                .selectionView {
                    SelectionLine(location: self.selectedBarTopCentreLocation,
                                  height: 295)
                }
                .onAppear() {
                    let labelsFont = CTFontCreateWithName(("SFProText-Regular" as CFString), 10, nil)
                    
                    self.config.data.entries = self.entries
                    self.config.data.color = .lightRed
                    self.config.xAxis.labelsColor = .gray
                    self.config.xAxis.ticksColor = .lightGray
                    self.config.labelsCTFont = labelsFont
                    self.config.xAxis.ticksDash = [2, 4]
                    self.config.yAxis.labelsColor = .gray
                    self.config.yAxis.ticksColor = .lightGray
                    self.config.yAxis.ticksDash = [2, 4]
                    self.config.yAxis.minTicksSpacing = 30.0
                    self.config.yAxis.formatter = { (value, decimals) in
                        let format = ""
                        return String(format: " %.\(decimals)f\(format)", value)
                    }
                }
                .animation(.easeInOut)
                .onReceive([self.isXAxisTicksHidden].publisher.first()) { (value) in
                    self.config.xAxis.ticksColor = value ? .clear : .gray
                }
                .onReceive([self.xAxisTicksIntervalValue].publisher.first()) { (value) in
                    self.config.xAxis.ticksInterval = Int(value)
                }
                .onReceive(self.orientationChanged) { _ in
                    self.config.objectWillChange.send()
                }
            }.padding(30)
        }.frame(height: self.chartHeight)
        
    }
    
    func controlsView() -> some View {
        Group {
            Toggle("", isOn: self.$isXAxisTicksHidden)
                .padding(15)
                .hidden()
        }
    }
}



struct BarGraphView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
