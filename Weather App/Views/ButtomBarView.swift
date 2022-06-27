//
//  ButtomBarView.swift
//  Weather App
//
//  Created by Reza Enayati on 6/25/22.
//

import SwiftUI

struct BottomBarView: View {
    let k = K()
    
    var minTemp: String
    var maxTemp: String
    var humidity: String
    var feelsLike: String
    
    
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 40, style: .circular)
            .fill(k.lightGray)
            .edgesIgnoringSafeArea(.bottom)
            .frame(height: 250)
            .aspectRatio(contentMode: .fill)
            .foregroundColor(k.bottomBarDarkBlue3)
            .overlay(
                HStack{
                    VStack{
                        Spacer()
                        DetailView(text: "Minimum:", num: minTemp, sufix: "°C", iconName: "thermometer.snowflake")
                        Spacer()
                        DetailView(text: "Feels Like:", num: feelsLike, sufix: "°C", iconName: "thermometer")
                        Spacer()
                    }.padding(.leading)
                    VStack{
                        Spacer()
                        DetailView(text: "Maximum:", num: maxTemp, sufix: "°C", iconName: "thermometer.sun.fill")
                        Spacer()
                        DetailView(text: "Humidity:", num: humidity, sufix: " %", iconName: "drop.fill")
                        Spacer()
                    }.padding(.trailing)
                    
                }.padding(.top)
            )
    }
}

struct ButtomBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarView(minTemp: "30", maxTemp: "30", humidity: "30", feelsLike: "30").previewLayout(.sizeThatFits)
    }
}

struct DetailView: View {
    
    let k = K()
    var text: String
    var num: String
    var sufix: String?
    var iconName: String
    //var imageName: String
    
    var body: some View {
        HStack{
            Spacer()
            Image(systemName: iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 40, alignment: .center)
                .foregroundColor(.gray)
            VStack{
                Text(text)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundColor(k.darkGray)
                Text("\(num)\(sufix ?? "")")
                    .font(.system(size: 35, weight: .semibold, design: .rounded))
                    .foregroundColor(k.darkBlue2)
            }
            Spacer()
            
        }//.padding(.all)
    }
}
