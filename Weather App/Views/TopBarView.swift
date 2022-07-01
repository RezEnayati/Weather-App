//
//  TopBarView.swift
//  Weather App
//
//  Created by Reza Enayati on 6/25/22.
//

import SwiftUI
import CoreLocationUI
import MapKit

struct TopBarView: View {
    
    @Binding var searchFieldText: String
    @StateObject var dateViewModel = DateViewModel()
    
    var location: String
    var function: () -> Void
    
    var body: some View {
        
        ZStack {
            HStack {
                VStack {
                    HStack {
                        NavigationLink {
                            ScrollView()
                        } label: {
                            Image(systemName: "list.dash")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 20, alignment: .center)
                                .foregroundColor(.white)
                                .padding(.leading)
                                .padding(.top)
                        }

                        TextField(K.cityFinder, text: $searchFieldText)
                            .frame(height: 30, alignment: .center)
                            .background(.white)
                            .cornerRadius(10)
                            .padding(.leading)
                            .padding(.top)
                            .textFieldStyle(.roundedBorder)
                            .ignoresSafeArea(.keyboard)
                            .submitLabel(.go)
                        Button {
                            self.function()
                        } label: {
                            Image(systemName: K.locationIcon)
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
    }
}
