//
//  CardView.swift
//  Weather App
//
//  Created by Reza Enayati on 6/25/22.
//

import SwiftUI

struct infoCardView: View {
    
    let text: String
    let num: String
    let k = K()
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .fill(.white)
            .padding(.all)
            .overlay(
                HStack {
                    Text(text)
                        .font(.system(size: 20, weight: .medium, design: .rounded))
                        .foregroundColor(k.bottomBarDarkBlue2)
                    Text(num)
                        .font(.system(size: 20, weight: .medium, design: .rounded))
                        .foregroundColor(k.bottomBarDarkBlue2)
                }
            )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        infoCardView(text: "Feels like:", num: "40").previewLayout(.sizeThatFits)
    }
}
