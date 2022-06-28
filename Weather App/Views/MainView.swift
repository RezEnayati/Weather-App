//
//  ContentView.swift
//  Weather App
//
//  Created by Reza Enayati on 6/22/22.
//

import SwiftUI
import MapKit

struct MainView: View {
    
    let k = K()
    
    @StateObject var weatherManager = WeatherManager()
    @ObservedObject var locationManager = LocationManager()
    @State private var textFieldText = ""
    
    @State var textfieldText: String?
    var body: some View {
        let coordinate = self.locationManager.location != nil ? self.locationManager.location!.coordinate : CLLocationCoordinate2D()
        
        return ZStack {
            LinearGradient(gradient: Gradient(colors: [k.skyBlue, k.darkBlue]), startPoint: .bottomTrailing, endPoint: .topTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack{
                //Text(textfieldText ?? "").fontWeight(.)
                TopBarView(location: weatherManager.cityName)
                    .ignoresSafeArea(.keyboard)
                Spacer()
                MiddleView(imageName: weatherManager.conditionString, temp: weatherManager.tempString)
                    .ignoresSafeArea(.keyboard)
                Spacer()
                BottomBarView(minTemp: weatherManager.minTempString, maxTemp: weatherManager.maxTempString, humidity: weatherManager.humidityString, feelsLike: weatherManager.feelsLikeString)
                    .ignoresSafeArea(.keyboard)
            }.ignoresSafeArea(.keyboard, edges: .bottom)
        }.ignoresSafeArea(.keyboard)
        .onAppear {
            weatherManager.fetchWeather(latitude: coordinate.latitude, logitude: coordinate.longitude)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

