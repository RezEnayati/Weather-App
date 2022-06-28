//
//  TestView.swift
//  Weather App
//
//  Created by Reza Enayati on 6/28/22.
//

import SwiftUI

struct TestView: View {
    @State var textFieldText: String = ""
    
    var body: some View {
        VStack {
            HStack{
                Text(textFieldText)
            }
            ExtractedView(textFieldText: $textFieldText)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

struct ExtractedView: View {
    @Binding var textFieldText: String
    var body: some View {
        HStack{
            TextField("Enter Name", text: $textFieldText)
        }
    }
}
