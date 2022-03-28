//
//  Models.swift
//  MVVMWeather
//
//  Created by Eclectics on 21/03/2022.
//

import Foundation
//Data
//Codable is aptotocol we can use to convert JSON data directly into structs
struct WeatherModel :Codable{
    let timezone: String
    let current: CurrentWeather
}

struct CurrentWeather: Codable{
    let temp: Float
    //weather is an array of struct weather info
    let weather: [WeatherInfo]
}

struct WeatherInfo: Codable{
    let main: String
    let description: String
}



//We create our structs based on how the JSON response looks like
/**
 {
     "lat": 40.7128,
     "lon": -74,
     "timezone": "America/New_York",
     "timezone_offset": -14400,
     "current": {
         "dt": 1647869546,
         "sunrise": 1647860264,
         "sunset": 1647904112,
         "temp": 282.1,
         "feels_like": 279.58,
         "pressure": 1019,
         "humidity": 48,
         "dew_point": 271.86,
         "uvi": 2.05,
         "clouds": 0,
         "visibility": 10000,
         "wind_speed": 4.63,
         "wind_deg": 290,
         "weather": [
             {
                 "id": 800,
                 "main": "Clear",
                 "description": "clear sky",
                 "icon": "01d"
             }
         ]
     }
 }
 */

