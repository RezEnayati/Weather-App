//
//  WeatherManager.swift
//  Weather App
//
//  Created by Reza Enayati on 6/25/22.
//

import Foundation


class WeatherManager: ObservableObject {
    
    
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?,us&appid=3449b3e01c720fb49afc1f4a1f00b31f&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        
        if let url = URL(string: urlString) {    
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                } else {
                    
                    if let safeData = data {
                        if let safeWeather = self.parsJSON(weatherData: safeData){
                            
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func parsJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let id = decodedData.weather[0].id
            let cityName = decodedData.name
            let temp = decodedData.main.temp
            let feelsLike = decodedData.main.feels_like
            let min = decodedData.main.temp_min
            let max = decodedData.main.temp_max
            let pressure = decodedData.main.pressure
            let humidity = decodedData.main.humidity
            let windSpeed = decodedData.wind.speed
            let weather = WeatherModel(conditionId: id, cityName:cityName, tempreture: temp, feelsLike: feelsLike, minimumTemp: min, maximumTemp: max, pressure: pressure, humidity: humidity, windSpeed: windSpeed)
            return weather
        }catch {
            print(error)
            return nil
        }
    }
    
}
