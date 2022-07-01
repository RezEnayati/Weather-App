//
//  ScrollView.swift
//  Weather App
//
//  Created by Reza Enayati on 6/30/22.
//

import SwiftUI

struct ScrollView: View {

    var body: some View {
        NavigationView {
            List {
                ScrollViewButton(cityName: "London", cityTemp: "30", imageIcon: "cloud.fill")
                    .listRowSeparator(.hidden)
                ScrollViewButton(cityName: "London", cityTemp: "30", imageIcon: "cloud.fill")
                    .listRowSeparator(.hidden)
                ScrollViewButton(cityName: "London", cityTemp: "30", imageIcon: "cloud.fill")
                    .listRowSeparator(.hidden)
                ScrollViewButton(cityName: "London", cityTemp: "30", imageIcon: "cloud.fill")
                    .listRowSeparator(.hidden)
            }.listStyle(.plain)
            .navigationBarTitle("Cities")
            
        }
    }
}

struct ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView()
    }
}
