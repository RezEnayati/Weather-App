//
//  ScrollView.swift
//  Weather App
//
//  Created by Reza Enayati on 6/30/22.
//

import SwiftUI

struct ScrollView: View {
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(K.bottomBarDarkBlue1)
    
    }
    var body: some View {
        NavigationView {
            List {
                Text("Weather 1")
                Text("Weather 2")
                Text("Weather 3")
            }
            .navigationBarTitle("Weather List ")
        }
    }
}

struct ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView()
    }
}
