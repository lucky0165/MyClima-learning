//
//  WeatherManager.swift
//  MyClima-learning
//
//  Created by Łukasz Rajczewski on 07/11/2020.
//

import Foundation

struct WeatherManager {
    
    let urlString = "https://api.openweathermap.org/data/2.5/weather?appid=a9b5f67728cfa8072bf3751c9320eb76"
    
    func fetchData(_ cityName: String) {
        let url = "\(urlString)&q=\(cityName)"
        print(url)
    }
    
}
