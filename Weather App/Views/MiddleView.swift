//
//  MiddleView.swift
//  Weather App
//
//  Created by Reza Enayati on 6/27/22.
//

import SwiftUI

struct MiddleView: View {

    var imageName: String
    var temp: String
    
    var body: some View {
        VStack{
            Image(systemName: imageName )
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, alignment: .center)
                .foregroundColor(.white)
                .padding(.top)
                .ignoresSafeArea(.keyboard)
            Text("\(temp)°C")
                .font(.system(size: 90, weight: .light, design: .rounded))
                .foregroundColor(.white)
                .ignoresSafeArea(.keyboard)
        }.ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct MiddleView_Previews: PreviewProvider {
    static var previews: some View {
        MiddleView(imageName: "cloud.fill", temp: "30").previewLayout(.sizeThatFits)
    }
}
