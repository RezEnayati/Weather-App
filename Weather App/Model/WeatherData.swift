//
//  WeatherModel.swift
//  Weather App
//
//  Created by Reza Enayati on 6/25/22.
//

import Foundation

struct WeatherData: Decodable {
    
    let name: String
    let main: Main
    let weather: [Weather]
    let wind: Wind
}

struct Wind: Decodable {
    let speed: Double
}

struct Main: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct Weather: Decodable {
    let id: Int
}
