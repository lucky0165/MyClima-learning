//
//  WeatherData.swift
//  MyClima-learning
//
//  Created by Łukasz Rajczewski on 07/11/2020.
//

import Foundation

struct WeatherData {
    let cityName: String
    let temperature: Double
    let id: Int
    let description: String
    
    var tempString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
    
        switch id {
                case 200...232:
                    return "cloud.bolt"
                case 300...321:
                    return "cloud.drizzle"
                case 500...531:
                    return "cloud.rain"
                case 600...622:
                    return "cloud.snow"
                case 701...781:
                    return "cloud.fog"
                case 800:
                    return "sun.max"
                case 801...804:
                    return "cloud.bolt"
                default:
                    return "cloud"
                }
    }
}
