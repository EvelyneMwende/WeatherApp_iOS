//
//  ContentView.swift
//  MVVMWeather
//
//  Created by Eclectics on 21/03/2022.
//

import SwiftUI

struct ContentView: View {
    //creating an instance of WeatherViewModel
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        NavigationView{
            //verical stack
            VStack{
                //getting content from view model and setting it to a text view
                Text(viewModel.timezone).font(.system(size: 32))
                Text(viewModel.temp).font(.system(size: 44))
                Text(viewModel.title).font(.system(size: 24))
                Text(viewModel.descriptionText).font(.system(size: 24))
                
                
            }.navigationTitle("Weather MVVM")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            
    }
}
