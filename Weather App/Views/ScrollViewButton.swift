//
//  ScrollViewButton.swift
//  Weather App
//
//  Created by Reza Enayati on 7/1/22.
//

import SwiftUI

struct ScrollViewButton: View {
    @State var cityName: String
    @State var cityTemp: String
    @State var imageIcon: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(K.scrollGradient)
                .frame(height: 110 , alignment: .center)
                .overlay(
                    HStack{
                        Text(cityName+":")
                            .foregroundColor(.white)
                            .font(.system(size: 35, weight: .semibold, design: .rounded))
                        Text(cityTemp+K.degrees)
                            .foregroundColor(.white)
                            .font(.system(size: 35, weight: .semibold, design: .rounded))
                        Image(systemName: imageIcon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 35, alignment: .center)
                            .foregroundColor(.white)
                            
                    }
                )
        }
        
    }
}

struct ScrollViewButton_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewButton(cityName: "New York", cityTemp: "30", imageIcon: "cloud.fill")
    }
}
