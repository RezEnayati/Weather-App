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
    @State var searchFieldText: String = "New York"
    @StateObject var dateViewModel = DateViewModel()
    
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    HStack {
                        TextField("Enter City Name:", text: $searchFieldText)
                            .textFieldStyle(.roundedBorder)
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .padding(.leading)
                            .padding(.top)
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
                        }

                    }
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
