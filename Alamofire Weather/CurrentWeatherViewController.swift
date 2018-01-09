//
//  CurrentWeatherViewController.swift
//  Alamofire Weather
//
//  Created by Alhidayat on 1/8/18.
//  Copyright © 2018 Alhidayat. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {
    
    @IBOutlet weak var cityTextLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureScaleLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!

    let forecastAPIKey = "93132054eb27fba2c206ea00a6399415"
    let coordinate: (lat: Double, long: Double) = (37.8267,-122.4233)
    var forecastService: ForecastService!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getCurrentWeather(latitude: coordinate.lat, longitude: coordinate.long)
        { (currentWeather) in
            
                if let currentWeather = currentWeather {
                    DispatchQueue.main.async {
                        if let temperature = currentWeather.temperature {
                            self.temperatureLabel.text = "\(temperature)º"
                        }else {
                            self.temperatureLabel.text = "-"
                        }
                    }
                }
            }
        }
    }

