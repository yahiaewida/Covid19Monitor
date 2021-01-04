//
//  CountryDetailsViewModel.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 1/3/21.
//


import Foundation
import Combine

class CountryDetailsViewModel: BaseViewModel, ObservableObject {
    private let dataManager = DataManager()
    @Published private(set) var countryDetails = CountryDetails()
   
    init (countryName name: String) {
        super.init()
        if !name.isEmpty {
            self.getCountryDetails(countryName: name)
        }
    }
    
    private func getCountryDetails(countryName name: String){
        dataManager.getCountryDetails(countryName: name).sink { [weak self] (error) in
            guard let self = self else { return }
            self.countryDetails = CountryDetails()
            self.isLoading = false
        } receiveValue: { [weak self] (countryDetails) in
            guard let self = self else { return }
            
            self.countryDetails = countryDetails
            self.isLoading = false
        }.store(in: &subscriptions)
    }
    
    func getSortedByDayCasesArray() -> [Double] {
        let sortedElements = countryDetails.timeline.cases.sorted { (value1 , value2) in
            let date1 = self.getDate(dic:value1)
            let date2 = self.getDate(dic:value2)
            return date1 <= date2
        }
        
        var sortedArray = [Double]()
        for sortedDict in sortedElements {
            sortedArray.append(sortedDict.value)
        }
        return sortedArray
    }
    
    private func getDate(dic: Dictionary<String,Double>.Element) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        var dayFormat = ""
        var monthFormat = ""
        
        let splitArray = dic.key.split(separator: "/")
        if splitArray.count > 0 {
            dayFormat = getCharactersFormat(value: String(splitArray[1]) , char: "d")
            monthFormat = getCharactersFormat(value: String(splitArray[0]) , char: "M")
        }
        dateFormatter.dateFormat = monthFormat + "/" + dayFormat + "/yy"
        return dateFormatter.date(from:dic.key) ?? Date()
    }
    
    private func getCharactersFormat(value: String , char : String) -> String {
        if Int64(value) ?? 0 < 10 {
           return char
        } else {
            return (char + char)                //MM or dd
        }
    }
}
