//
//  WeatherModel.swift
//  Weather App
//
//  Created by Reza Enayati on 6/29/22.
//

import Foundation

class WeatherModel: ObservableObject {
    
    @Published var cityName: String =  "-"
    @Published var feelsLikeString: String =  "-"
    @Published var tempString: String =  "-"
    @Published var minTempString: String =  "-"
    @Published var maxTempString: String =  "-"
    @Published var conditionString: String =  "-"
    @Published var humidityString: String =  "-"
    var conditionID: Int
    
    init (cityName: String, feelsLike: Double, temp: Double, minTemp: Double, maxTemp: Double, conditionId: Int, humidity: Int){
        self.cityName = cityName
        self.feelsLikeString = String(format: "%.f", feelsLike)
        self.tempString = String(format: "%.f", temp)
        self.minTempString = String(format: "%.f", minTemp)
        self.maxTempString = String(format: "%.f", maxTemp)
        self.conditionID = conditionId
        self.humidityString = String(humidity)
        var conditionIdString: String {
            return getConditionString(conditionID: conditionID)
        }
        
        self.conditionString = self.conditionString
    }
    
}

//MARK: -  Extra Functions
extension WeatherModel {
    
    private func stringCoverter(double: Double) -> String {
        return String(format: "%.f", double)
    }
    
    private func getConditionString(conditionID: Int) -> String {
        switch conditionID {
        case 200...232:
            return "cloud.bolt.rain.fill"
        case 300...321:
            return "cloud.drizzle.fill"
        case 500...531:
            return "cloud.rain.fill"
        case 600...622:
            return "cloud.snow.fill"
        case 701...781:
            return "cloud.fog.fill"
        case 800:
            return "sun.max.fill"
        case 801...804:
            return "cloud.bolt.fill"
        default:
            return "cloud.fill"
        }
    }
}
