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
        RoundedRectangle(cornerRadius: 50, style: .continuous)
            .fill(k.bottomBarDarkBlue2)
            .ignoresSafeArea()
            .aspectRatio(contentMode: .fill)
            .frame(height: 100)
            .overlay(
                VStack{
                    HoriontalInfoCardView()
                    HoriontalInfoCardView()
                    HoriontalInfoCardView()
                }
            )
        
    }
}

struct HoriontalInfoCardView: View {
    var body: some View {
        HStack{
            HStack{
                infoCardView(text: "Feels Like", num: "40")
                infoCardView(text: "Pressure", num: "40")
            }}
    }
}

struct ButtomBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarView()
    }
}


