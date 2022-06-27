//
//  ContentView.swift
//  Weather App
//
//  Created by Reza Enayati on 6/22/22.
//

import SwiftUI
import CoreLocationUI

struct MainView: View {
    
    let k: K = K()
    let locationManager = LocationManager()
    
    
    @State var weatherImage: String = "cloud.fill"
    @State var temp: Int = 20
    @State var location: String = "New York"
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [k.skyBlue, k.darkBlue]), startPoint: .bottomTrailing, endPoint: .topTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack{
                TopBarView(location: location)

                LocationButton(.shareCurrentLocation) {
                    locationManager.requestLocation()
                }
                .cornerRadius(30)
                .foregroundColor(.white)
                .symbolVariant(.fill)
                Spacer()
                Image(systemName: weatherImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, alignment: .center)
                    .foregroundColor(.white)
                    .padding(.top)
                Text("\(temp)°C")
                    .font(.system(size: 90, weight: .light, design: .rounded))
                    .foregroundColor(.white)
             
                Spacer()
                BottomBarView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.portrait)
    }
}
