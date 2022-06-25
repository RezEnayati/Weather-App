//
//  ContentView.swift
//  Weather App
//
//  Created by Reza Enayati on 6/22/22.
//

import SwiftUI

struct MainView: View {
    
    let k: K = K()
    let locationManager = LocationViewModel()
    
    
    @State var weatherImage: String = "cloud.fill"
    @State var temp: Int = 20
    @State var location: String = "New York"
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [k.skyBlue, k.darkBlue]), startPoint: .bottomTrailing, endPoint: .topTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack{
                TopBarView(location: location)
                //Spacer()
                Image(systemName: weatherImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 170, alignment: .center)
                    .foregroundColor(.white)
                    .padding(.top)
                Text("\(temp)°C")
                    .font(.system(size: 60, weight: .bold, design: .rounded))
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
    }
}
