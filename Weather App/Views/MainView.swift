//
//  ContentView.swift
//  Weather App
//
//  Created by Reza Enayati on 6/22/22.
//

import SwiftUI
import MapKit

struct MainView: View {
    
    @ObservedObject var weatherViewModel = WeatherViewModel()
    @ObservedObject var locationManager = LocationManager()
    
    var body: some View {
        
        let coordinate = locationManager.location != nil ? locationManager.location!.coordinate : CLLocationCoordinate2D()
        return ZStack {
            K.gradient.edgesIgnoringSafeArea(.all)
            VStack{
                
                TopBarView(searchFieldText: $weatherViewModel.textFieldText , dateString: weatherViewModel.dateString, location: weatherViewModel.cityName, imageIcon: weatherViewModel.imgeIcon, textFieldPlaceHolder: weatherViewModel.textFieldPalceHolder){
                    weatherViewModel.fetchWeather(latitude: coordinate.latitude, logitude: coordinate.longitude)
                }
                .onSubmit {
                    weatherViewModel.updateTextField(textFieldText: weatherViewModel.textFieldText)
                    weatherViewModel.textFieldText = ""
                }
                
                
                Spacer()
                
                MiddleView(imageName: weatherViewModel.conditionString, temp: weatherViewModel.tempString)
                
                Spacer()
                
                BottomBarView(minTemp: weatherViewModel.minTempString, maxTemp: weatherViewModel.maxTempString, humidity: weatherViewModel.humidityString, feelsLike: weatherViewModel.feelsLikeString)
                
            }.ignoresSafeArea(.keyboard, edges: .bottom)
        }
        .onAppear {
            weatherViewModel.fetchWeather(latitude: coordinate.latitude, logitude: coordinate.longitude)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

