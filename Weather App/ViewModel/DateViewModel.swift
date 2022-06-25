//
//  DateViewModel.swift
//  Weather App
//
//  Created by Reza Enayati on 6/25/22.
//

import Foundation

class DateViewModel: ObservableObject {
    
    @Published var dayString: String = ""
    
    init(){
        dayString = getDay()
    }

    func getDay() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayString = dateFormatter.string(from: date)
        return dayString
    }
}
