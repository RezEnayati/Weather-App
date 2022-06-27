//
//  ButtomBarView.swift
//  Weather App
//
//  Created by Reza Enayati on 6/25/22.
//

import SwiftUI

struct BottomBarView: View {
    let k = K()
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
                        DetailView(text: "Minimum:", num: 20, sufix: "°C", iconName: "thermometer.snowflake")
                        Spacer()
                        DetailView(text: "Feels Like:", num: 30, sufix: "°C", iconName: "thermometer")
                        Spacer()
                    }.padding(.leading)
                    VStack{
                        Spacer()
                        DetailView(text: "Maximum:", num: 20, sufix: "°C", iconName: "thermometer.sun.fill")
                        Spacer()
                        DetailView(text: "Humidity:", num: 20, sufix: " %", iconName: "drop.fill")
                        Spacer()
                    }.padding(.trailing)
                    
                }.padding(.top)
            )
    }
}

struct ButtomBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarView().previewLayout(.sizeThatFits)
    }
}

struct DetailView: View {
    
    let k = K()
    var text: String
    var num: Int
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
                    .font(.system(size: 40, weight: .semibold, design: .rounded))
                    .foregroundColor(k.darkBlue2)
            }
            Spacer()
            
        }//.padding(.all)
    }
}
