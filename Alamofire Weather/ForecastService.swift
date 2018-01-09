//
//  ForecastService.swift
//  Alamofire Weather
//
//  Created by Alhidayat on 1/8/18.
//  Copyright © 2018 Alhidayat. All rights reserved.
//

import Foundation
import Alamofire


class ForecastService
{
    // Sample url: https://api.darksky.net/forecast/93132054eb27fba2c206ea00a6399415/37.8267,-122.4233
    
    let forecastAPIKey: String
    let forecastBaseURL: URL?
    
    init(APIKey: String)
    {
        self.forecastAPIKey = APIKey
        forecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    
    func getCurrentWeather(latitude: Double, longitude: Double, completion: @escaping(CurrentWeather?) -> Void)
    {
        if let forecastURL = URL(string: "\(forecastBaseURL!)/\(latitude),\(longitude)"){
            
            Alamofire.request(forecastURL).responseJSON(completionHandler: {(response) in
                if let jsonDictionary = response.result.value as? [String: Any] {
                    if let currentWeatherDictionary = jsonDictionary["currently"] as? [String: Any] {
                        let currentWeather = CurrentWeather.init(weatherDictionary: currentWeatherDictionary)
                        completion(currentWeather)
                    }else {
                        completion(nil)
                    }
                }
                
            })
        }
    }
}









