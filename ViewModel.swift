//
//  ViewModel.swift
//  MVVMWeather
//
//  Created by Eclectics on 21/03/2022.
//

import Foundation
//Data needed by the view

class WeatherViewModel: ObservableObject{
    
    //Published- any time these variables get updated any view holding on to an instance of this view model will update the respective UI
    @Published var title: String = "-"
    @Published var descriptionText: String = "-"
    @Published var temp: String = "-"
    @Published var timezone: String = "-"
    
    //make an api call whenever we instantiate viewmodel/whenever the view loads in ContentView
    
    init(){
        fetchWeather()
    }
    
    func fetchWeather(){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=40.7128&lon=-74&exclude=hourly,daily,minutely&appid=53aa2abb5cf466dc7e54e7acf79b6dc4") else{
            return
        }
        //create api call
        let task = URLSession.shared.dataTask(with: url){ data, _, error in
            guard let data = data, error == nil else {
                return
                
            }
            // Convert data to Model
            //decode model from data
            do{
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                
                //update the Published properties
                DispatchQueue.main.async {
                    self.title = model.current.weather.first?.main ?? "No Title"
                    self.descriptionText = model.current.weather.first?.description ?? "No Description"
                    //make temp a string cause in the api it is of type float
                    self.temp = "\(model.current.temp)°"
                    self.timezone = model.timezone
                }
            }
            catch{
                print("Failed")
            }
        }
        task.resume()
    }
        
}
