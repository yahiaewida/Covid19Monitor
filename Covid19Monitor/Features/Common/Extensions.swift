//
//  Extensions.swift
//  Covid19Monitor
//
//  Created by Yahia Ewida on 12/27/20.
//

import Foundation
import SwiftUI
import CoreGraphics
import Charts

extension Color {
    static let lightGray = Color( red: 0, green: 0, blue: 0, opacity: 0.05)
    static let darkPurple = Color(red: 69/255, green: 66/255, blue: 146/255)
    static let lightPurple = Color(red: 106/255, green: 103/255, blue: 167/255)
    static let lightBlue = Color(red: 103/255, green: 180/255, blue: 249/255)
    static let lightRed = Color(red: 237/255, green: 101/255, blue: 95/255)
    static let lightGreen = Color(red: 118/255, green: 213/255, blue: 132/255)
    static let customizedPurple = Color(red: 130/255, green: 95/255, blue: 238/255)
}


extension UINavigationController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.standardAppearance.configureWithTransparentBackground()
        navigationBar.isHidden = true
    }
}

extension Array where Element == Country{
    func firstIndex(of element :Element) -> Int?{
        for index in 0..<self.count{
            if self[index].country == element.country{
                return index
            }
        }
        return nil
    }
}

extension Array  where Element == CountryRealm {
    func toCountryArray() -> [Country] {
        var countriesArray = [Country]()
        
        self.forEach { countryRealm in
            countriesArray.append(countryRealm.toCountryObject())
        }
        
        return countriesArray
    }
}


extension ChartColorTemplates {
    @objc open class func covid19Colors () -> [NSUIColor]
    {
        return [
            NSUIColor(red: 103/255, green: 180/255, blue: 249/255, alpha: 1.0),
            NSUIColor(red: 0/255, green: 0/255, blue: 200/255, alpha: 0.8),
            NSUIColor(red: 118/255, green: 213/255, blue: 132/255, alpha: 1.0),
            NSUIColor(red: 220/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)
        ]
    }
}
