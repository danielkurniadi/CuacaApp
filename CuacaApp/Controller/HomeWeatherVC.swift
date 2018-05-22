//
//  ViewController.swift
//  CuacaApp
//
//  Created by Student 3 on 9/3/18.
//  Copyright © 2018 Student 3. All rights reserved.
//

import UIKit

class HomeWeatherVC: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    let APIKey: String = "59c23e806e61b398c0771989d42c788e"
    let coordinate: (lat: Double, long: Double) = (6.1751,106.8652)
    var forecastService : ForecastService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI(){
        forecastService = ForecastService(APIKey: APIKey)
        forecastService.getCurrentWeather(lattitude: coordinate.lat, longitude: coordinate.long) { (response) in
            if let currentWeather = response{
                DispatchQueue.main.async {
                    // Display Data please
                    if let temp = currentWeather.temperature as? Double{
                        self.temperatureLabel.text = "\(Int(temp))°"
                    }else {return}                    
                }
            }
        }
    }
    

}

