//
//  CurrentWeather.swift
//  CuacaApp
//
//  Created by Student 3 on 9/3/18.
//  Copyright © 2018 Student 3. All rights reserved.
//

import Foundation

class CurrenWeather{
    
    let temperature: Double
    let currentHumidity: Int?
    let precipProbability: Int?
    let currentSummary: String?
    let currentIcon: String?
    
    struct WeatherKeys {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipProbability = "precipProbability"
        static let summary = "summary"
        static let icon = "icon"
    }
    
    init(weatherDictionary: [String : Any]){
        temperature = weatherDictionary["temperature"] as! Double
        print(temperature)
//        if let temp = weatherDictionary["temperature"] as? Double{
//            self.temperature = temp
//        } else{
//            self.temperature = nil
//            print("nih",self.temperature!)
//        }
//
        if let humidity = weatherDictionary[WeatherKeys.humidity] as? Double{
            self.currentHumidity = Int(humidity*100)
        } else{ self.currentHumidity = nil}
        
        if let precip = weatherDictionary[WeatherKeys.precipProbability] as? Int{
            precipProbability = precip
        } else{ precipProbability = nil}
        
        if let summary = weatherDictionary[WeatherKeys.summary] as? String{
            currentSummary = summary
        } else{ currentSummary = "Dunno"}
        if let icon = weatherDictionary[WeatherKeys.icon] as? String{
            currentIcon = icon
        } else{ currentIcon = "Rain" }
        
    }
}
