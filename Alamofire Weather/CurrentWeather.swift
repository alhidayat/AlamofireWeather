//
//  CurrentWeather.swift
//  Alamofire Weather
//
//  Created by Alhidayat on 1/8/18.
//  Copyright © 2018 Alhidayat. All rights reserved.
//

import Foundation

class CurrentWeather
{
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    let icon : String?
    
    struct WeatherKeys {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipProbability = "precipProbability"
        static let summary = "summary"
        static let icon = "icon"
    }
    
    init(weatherDictionary: [String : Any])
    {
        temperature = weatherDictionary[WeatherKeys.temperature] as? Int
        
        if let humidityDouble = weatherDictionary[WeatherKeys.humidity] as? Double
            {
                humidity = Int(humidityDouble * 100)
        }else {
            humidity = nil
        }
        
        if let pricipDouble = weatherDictionary[WeatherKeys.precipProbability] as? Double {
            precipProbability = Int(pricipDouble * 100)
        }else {
            precipProbability = nil
        }
        
        summary = weatherDictionary[WeatherKeys.summary] as? String
        icon = weatherDictionary[WeatherKeys.icon] as? String
    }
    /*
     "time":1515393997,
     "summary":"Partly Cloudy",
     "icon":"partly-cloudy-night",
     "nearestStormDistance":0,
     "precipIntensity":0,
     "precipProbability":0,
     "temperature":50.45,
     "apparentTemperature":50.45,
     "dewPoint":47.57,
     "humidity":0.9,
     "pressure":1016.29,
     "windSpeed":0.95,
     "windGust":2.26,
     "windBearing":103,
     "cloudCover":0.33,
     "uvIndex":0,
     "visibility":10,
     "ozone":293.67
     */
}
