//
//  LoadingView.swift
//  Weather App
//
//  Created by Reza Enayati on 6/27/22.
//

import SwiftUI

struct LoadingView: View {
    let k = K()
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [k.skyBlue, k.darkBlue]), startPoint: .bottomTrailing, endPoint: .topTrailing)
                .edgesIgnoringSafeArea(.all)
            ProgressView("Loading Weather Data!")
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .aspectRatio(contentMode: .fill)
                .frame(height: 100, alignment: .center)
                .foregroundColor(.white)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

