//
//  TopBarView.swift
//  Weather App
//
//  Created by Reza Enayati on 6/25/22.
//

import SwiftUI

struct TopBarView: View {
    let k = K()
    
    @State var location: String
    @StateObject var dateViewModel = DateViewModel()
    
    var body: some View {
        ZStack {
            HStack {
                Button {
                    //Button Action
                } label: {
                    Image(systemName: "list.bullet.indent")
                        .font(Font.title.weight(.light))
                        .padding(.leading)
                        .foregroundColor(.white)
                }
                Spacer()
                VStack {
                    Text(location)
                        .font(.system(size: 30, weight: .light, design: .rounded))
                        .foregroundColor(.white)
                    HStack {
                        Text(dateViewModel.dayString)
                            .font(.system(size: 20, weight: .light, design: .rounded))
                        .foregroundColor(.white)
                        Text(Date.now, format: .dateTime.day().month().year())
                            .font(.system(size: 20, weight: .light, design: .rounded))
                        .foregroundColor(.white)
                    }
                }
                Spacer()
                Button {
                    //Button Action
                } label: {
                    Image(systemName: "location.fill")
                        .font(Font.title.weight(.light))
                        .padding(.trailing)
                        .foregroundColor(.white)

                }
            }
        }//.background(k.darkBlue)
    }
}

struct TopBarView_Previews: PreviewProvider {
    
    @State static var location = "New York"
    
    static var previews: some View {
        TopBarView(location: location)
            .previewLayout(.sizeThatFits)
    }
}
