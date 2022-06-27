//
//  ContentView.swift
//  Weather App
//
//  Created by Reza Enayati on 6/22/22.
//

import SwiftUI

struct MainView: View {
    
    let k = K()
    @ObservedObject var weatherManager = WeatherManager()
    
    @State var temp: Int = 20
    @State var location: String = "New York"
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [k.skyBlue, k.darkBlue]), startPoint: .bottomTrailing, endPoint: .topTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack{
                TopBarView(location: weatherManager.cityName)
                .cornerRadius(30)
                .foregroundColor(.white)
                .symbolVariant(.fill)
                Spacer()
                Image(systemName: weatherManager.conditionString)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, alignment: .center)
                    .foregroundColor(.white)
                    .padding(.top)
                Text("\(weatherManager.tempString)°C")
                    .font(.system(size: 90, weight: .light, design: .rounded))
                    .foregroundColor(.white)
                
                Spacer()
                BottomBarView(minTemp: weatherManager.minTempString, maxTemp: weatherManager.maxTempString, humidity: weatherManager.humidityString, feelsLike: weatherManager.feelsLikeString)
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
