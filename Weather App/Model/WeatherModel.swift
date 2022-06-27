//
//  WeatherModel.swift
//  Weather App
//
//  Created by Reza Enayati on 6/26/22.
//

import Foundation

struct WeatherModel{
    
    let conditionId: Int
    let cityName: String
    
    let tempreture: Double
    var tempretureString: String {
        return String(format: "%.1f", tempreture)
    }
    
    let feelsLike: Double
    var feelsLikeString: String {
        return String(format: "%.1f", feelsLike)
    }
    
    let minimumTemp: Double
    var minimumString: String {
        return String(format: "%.1f", minimumTemp)
    }
    
    let maximumTemp: Double
    var maximumString: String {
        return String(format: "%.1f", maximumTemp)
    }
    
    let pressure: Int
    var pressureString: String {
        return String(format: "%.1f", pressure)
    }
        
    let humidity: Int
    var humidityString: String {
        return String(format: "%.1f", humidity)
    }
    
    let windSpeed: Double
    var windSpeedString: String {
        return String(format: "%.1f", windSpeed)
    }
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "cloud.bolt"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
