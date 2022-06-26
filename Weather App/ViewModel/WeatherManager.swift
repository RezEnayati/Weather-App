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
                        // Convert Data into swift formant
                    }
                }
            }
            task.resume()
        }
    }
    
    func parsJSON(){
        
    }
    
}
