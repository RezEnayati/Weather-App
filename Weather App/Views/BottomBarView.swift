//
//  ButtomBarView.swift
//  Weather App
//
//  Created by Reza Enayati on 6/25/22.
//

import SwiftUI

struct BottomBarView: View {

    var minTemp: String
    var maxTemp: String
    var humidity: String
    var feelsLike: String
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 40, style: .circular)
            .fill(K.lightGray)
            .edgesIgnoringSafeArea(.bottom)
            .frame(height: 250)
            .aspectRatio(contentMode: .fill)
            .foregroundColor(K.bottomBarDarkBlue3)
            .overlay(
                HStack{
                    VStack{
                        Spacer()
                        DetailView(text: K.min, num: minTemp, sufix: K.degrees, iconName: K.coldThermo)
                        Spacer()
                        DetailView(text: K.feelsLike, num: feelsLike, sufix: K.degrees, iconName: K.thermo)
                        Spacer()
                    }.padding(.leading)
                    VStack{
                        Spacer()
                        DetailView(text: K.max, num: maxTemp, sufix: K.degrees, iconName: K.hotThermo)
                        Spacer()
                        DetailView(text: K.humidity , num: humidity, sufix: K.percentage, iconName: K.drop)
                        Spacer()
                    }.padding(.trailing)
                    
                }.padding(.top)
            ).ignoresSafeArea(.keyboard)
    }
}

struct DetailView: View {

    var text: String
    var num: String
    var sufix: String?
    var iconName: String
    
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
                    .foregroundColor(K.darkGray)
                Text("\(num)\(sufix ?? "")")
                    .font(.system(size: 35, weight: .semibold, design: .rounded))
                    .foregroundColor(K.darkBlue2)
            }
            Spacer()
            
        }
    }
}

struct ButtomBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarView(minTemp: "30", maxTemp: "30", humidity: "30", feelsLike: "30").previewLayout(.sizeThatFits)
    }
}
