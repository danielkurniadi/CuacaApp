//
//  ForecastService.swift
//  CuacaApp
//
//  Created by Student 3 on 9/3/18.
//  Copyright © 2018 Student 3. All rights reserved.
//

import Foundation
import Alamofire

class ForecastService{
    
    let forecastAPIKey: String
    let forecastBaseURL: URL?
    // sample call: https://api.darksky.net/forecast/59c23e806e61b398c0771989d42c788e/37.8267,-122.4233
    
    init(APIKey:String){
        self.forecastAPIKey = APIKey
        forecastBaseURL = URL(string:"https://api.darksky.net/forecast/\(forecastAPIKey)")
    }
    
    func getCurrentWeather(lattitude: Double, longitude: Double, completion: @escaping(CurrenWeather?)->Void){
        if let forecastURL = URL(string: "\(forecastBaseURL!)/\(lattitude),\(longitude)"){
            
            Alamofire.request(forecastURL).responseJSON(completionHandler: { (response) in
                
                if let jsonDictionary = response.result.value as? [String : Any]{
                    
                    if let weatherDictionary = jsonDictionary["currently"] as? [String:Any]{
                        
                        let currentWeather = CurrenWeather(weatherDictionary: weatherDictionary)
                        completion(currentWeather)
                    }
                }else { completion(nil)}
            })
        }
    }
}
