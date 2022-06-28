//
//  WeatherManager.swift
//  Weather App
//
//  Created by Reza Enayati on 6/25/22.
//

import Foundation
import CoreLocation

class WeatherManager: ObservableObject{
    
    @Published var cityName: String = "-"
    @Published var feelsLikeString: String = "-"
    @Published var tempString: String = "-"
    @Published var minTempString: String = "-"
    @Published var maxTempString: String = "-"
    @Published var conditionString: String = "-"
    @Published var humidityString: String = "-"
    
    private let weatherURL = "https://api.openweathermap.org/data/2.5/weather?,us&appid=3449b3e01c720fb49afc1f4a1f00b31f&units=metric"
    
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
     
    func fetchWeather(latitude: CLLocationDegrees, logitude: CLLocationDegrees) -> Void{
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(logitude)"
        performRequest(urlString: urlString)
        //print("Fetched Weather with lat and lon")
    }
    
    private func performRequest(urlString: String){
        guard let url = URL(string: urlString) else {
            return
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, _, error in
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        let weatherModel = try decoder.decode(WeatherData.self, from:safeData)
                        DispatchQueue.main.async {
                            //Update our Published Variables
                            let cityName = weatherModel.name
                            let tempInt = weatherModel.main.temp
                            let feelLikeInt = weatherModel.main.feels_like
                            let tempMinInt =  weatherModel.main.temp_min
                            let tempMaxInt = weatherModel.main.temp_max
                            let humidityInt = weatherModel.main.humidity
                            let conditionIdInt = weatherModel.weather[0].id
                            
                            self.cityName =  cityName
                            self.tempString = self.stringCoverter(double: tempInt)
                            self.feelsLikeString = self.stringCoverter(double: feelLikeInt)
                            self.minTempString = self.stringCoverter(double: tempMinInt)
                            self.maxTempString = self.stringCoverter(double: tempMaxInt)
                            self.humidityString = String(humidityInt)
                            self.conditionString = self.getConditionString(conditionID: conditionIdInt)
                            
                        }
                    } catch {
                        print(error, "Failed to Fetch Data!")
                        
                    }
                }
            }else {
                print(error!)
                
            }
        }
        task.resume()
    }
    
}


//MARK: -  Convertor Functions
extension WeatherManager {
    
    private func stringCoverter(double: Double) -> String {
        return String(format: "%.1f", double)
        
    }
    
    private func getConditionString(conditionID: Int) -> String {
        switch conditionID {
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
