//
//  CountriesView.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/28/20.
//

import SwiftUI

struct CountriesView: View {
    @ObservedObject private var viewModel = CountriesViewModel()
    @State private var selectedFilter = continentsKeys[0]
    @State private var searchText = ""
    @State private var isFiltered = false
    
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white,.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(cgColor: Color.lightPurple.cgColor!),.font: UIFont.systemFont(ofSize: 16)], for: .selected)
        UISegmentedControl.appearance().backgroundColor = UIColor(cgColor: Color.lightPurple.cgColor!)
    }
    
    var body: some View {
        GeometryReader { reader in
            VStack {
                
                SearchBar(text: $searchText)
                    .padding()
                Picker("Filter",selection: $selectedFilter) {
                    ForEach(continentsKeys, id: \.self) { continent in
                        Text(continent).tag(continent)
                    }
                }
                .minimumScaleFactor(0.5)
                .pickerStyle(SegmentedPickerStyle())
                .padding([.leading, .trailing, .bottom])
                .onChange(of: selectedFilter, perform: { value in
                    self.isFiltered = true
                })
                
                ScrollView(showsIndicators: false) {
                    self.renderCountriesStatistics(reader : reader)
                }
                .frame(width: reader.size.width)                
            }
           
        }
        
    }
    
    private func renderCountriesStatistics(reader : GeometryProxy) -> AnyView {
        if isFiltered {
            isFiltered = false
            print("view Cleared")
            return AnyView(EmptyView())
        } else {
            if viewModel.isLoading {
                return AnyView(
                    VStack {
                        ProgressView()
                    }
                )
                
            } else {
                print("view Created")
                return AnyView(ForEach(viewModel.countriesData, id: \.country) { country in
                    getCountryStatisticsView(reader: reader, country: country)
                })
            }
        }
    }
    
    private func getCountryStatisticsView(reader : GeometryProxy,country: Country) -> some View {
        
        let upperHeader = HStack(alignment:.center) {
            Text(country.country ?? "")
                .font(Font.system(size: 22))
                .bold()
        }
        .padding([.top,.bottom],5)
        
        return StatisticsHeaderView(reader: reader, backgroundColor: Color.lightGray, fontColor: Color.black.opacity(0.8), upperHeader:upperHeader , height: 130,confirmed: country.cases ?? 0, recovered: country.recovered ?? 0, deaths: country.deaths ?? 0)
    }
}

struct CountriesView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView()
    }
}


import SwiftUI
 
struct SearchBar: View {
    @Binding var text: String
 
    @State private var isEditing = false
 
    var body: some View {
        HStack {
 
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                 
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
 
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}
