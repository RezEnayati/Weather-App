//
//  TopBarView.swift
//  Weather App
//
//  Created by Reza Enayati on 6/25/22.
//

import SwiftUI
import CoreLocationUI

struct TopBarView: View {
    let k = K()
    
    var location: String
    @State var searchFieldText: String = ""
    @StateObject var dateViewModel = DateViewModel()
    
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    HStack {
                        TextField("Enter a city Name", text: $searchFieldText)
                            .frame(height: 30, alignment: .center)
                            .background(.white)
                            .cornerRadius(10)
                            .padding(.leading)
                            .padding(.top)
                            .textFieldStyle(.roundedBorder)
                            .ignoresSafeArea(.keyboard)
                        Button {
                            //Some Code to make the search bar search
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 30, alignment: .center)
                                .foregroundColor(.white)
                                .padding(.trailing)
                                .padding(.top)
                        }.ignoresSafeArea(.keyboard)

                    }.ignoresSafeArea(.keyboard, edges: .bottom)
                    Text(location)
                        .font(.system(size: 30, weight: .light, design: .rounded))
                        .foregroundColor(.white)
                        .ignoresSafeArea(.keyboard)
                    HStack {
                        Text(dateViewModel.dayString)
                            .font(.system(size: 20, weight: .light, design: .rounded))
                        .foregroundColor(.white)
                        Text(Date.now, format: .dateTime.day().month().year())
                            .font(.system(size: 20, weight: .light, design: .rounded))
                        .foregroundColor(.white)
                        .ignoresSafeArea(.keyboard)
                    }
                }.ignoresSafeArea(.keyboard, edges: .bottom)

            }
        }.ignoresSafeArea(.keyboard)
        //.background(k.darkBlue)
    }
}

struct TopBarView_Previews: PreviewProvider {
    
    @State static var location = "New York"
    
    static var previews: some View {
        TopBarView(location: location)
            .previewLayout(.sizeThatFits)
    }
}
