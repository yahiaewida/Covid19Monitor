//
//  SegmentedPicker.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 1/4/21.
//

import SwiftUI

struct SegmentedPicker: View {
    @Binding var selectedStatistics : String
    var pickerValues : [String]
    
    init(selectedStatistics: Binding<String>, pickerValues : [String]) {
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white,.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(cgColor: Color.lightPurple.cgColor!),.font: UIFont.systemFont(ofSize: 16)], for: .selected)
        UISegmentedControl.appearance().backgroundColor = UIColor(cgColor: Color.lightPurple.cgColor!)
        self._selectedStatistics = selectedStatistics
        self.pickerValues = pickerValues
    }
    var body: some View {
        Picker("Filter",selection: $selectedStatistics) {
            ForEach(pickerValues, id: \.self) { test in
                Text(test).tag(test)
            }
        }
        .padding()
        .pickerStyle(SegmentedPickerStyle())
        .frame(width: UIScreen.main.bounds.width - 50)
        .scaledToFill()

    }
}

struct SegmentedPicker_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedPicker(selectedStatistics: .constant("Country"),pickerValues: ["Country", "Global"])
    }
}
