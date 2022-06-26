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
            .fill(
                LinearGradient(gradient: Gradient(colors: [k.skyBlue, k.bottomBarDarkBlue3]), startPoint: .bottomTrailing, endPoint: .topTrailing)
            )
            .edgesIgnoringSafeArea(.bottom)
            .frame(height: 250)
            .aspectRatio(contentMode: .fill)
            .foregroundColor(k.bottomBarDarkBlue3)
            .overlay(
                HStack{
                    VStack{
                        Spacer()
                        DetailView(text: "Feels Like", num: 20, sufix: "°C")
                        Spacer()
                        DetailView(text: "Minimum", num: 30)
                        Spacer()
                        DetailView(text: "Maximum", num: 30)
                        Spacer()
                    }.padding(.leading)
                    VStack{
                        Spacer()
                        DetailView(text: "Pressure", num: 20)
                        Spacer()
                        DetailView(text: "Humidity", num: 20)
                        Spacer()
                        DetailView(text: "Wind Speed", num: 30, sufix: " KM/H")
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
    
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(k.bottomBarDarkBlue2)
                .shadow(color: k.bottomBarDarkBlue2, radius: 2)
                .frame(height: 60)
                .overlay(
                    Text("\(text): \(num)\(sufix ?? "")")
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                )
        }
    }
}
