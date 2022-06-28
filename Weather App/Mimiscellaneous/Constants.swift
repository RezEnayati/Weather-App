//
//  Constants.swift
//  Weather App
//
//  Created by Reza Enayati on 6/25/22.
//

import Foundation
import SwiftUI

struct K {
    static let lightBlue: Color = Color(red: 0.87, green: 0.96, blue: 1.00)
    static let skyBlue: Color = Color(red: 0.35, green: 0.87, blue: 1.00)
    static let darkBlue: Color = Color(red: 0.07, green: 0.39, blue: 0.87)
    static let darkBlue2: Color = Color(red: 0.18, green: 0.35, blue: 0.52)
    static let bottomBarDarkBlue1: Color = Color(red: 0.00, green: 0.00, blue: 0.28)
    static let bottomBarDarkBlue2: Color = Color(red: 0.04, green: 0.00, blue: 0.53)
    static let bottomBarDarkBlue3: Color = Color(red: 0.13, green: 0.33, blue: 0.80)
    static let lighBackGroundBlue: Color = Color(red: 0.68, green: 0.85, blue: 0.90)
    static let lightGray: Color = Color(red: 0.95, green: 0.95, blue: 0.95)
    static let darkGray: Color = Color(red: 0.55, green: 0.55, blue: 0.55)
    static let launchScreenColor: Color = Color(red: 0.90, green: 0.90, blue: 0.90)
    
    static let degrees = "°C"
    
    static let min = "Minimum:"
    static let coldThermo = "thermometer.snowflake"
    
    static let max = "Maximum:"
    static let hotThermo = "thermometer.sun.fill"
    
    static let feelsLike = "Feels Like:"
    static let thermo = "thermometer"
    
    static let humidity = "Humidity:"
    static let percentage = "%"
    static let drop = "drop.fill"
    
    static let searching = "Finding City Please Wait!"
    static let cityFinder = "Enter a city Name"
    
    static let locationIcon = "location.circle.fill"
    
    static let cityFailed = "Could Not Find City!"
    static let failedData = "Failed to Fetch Data!"
}
