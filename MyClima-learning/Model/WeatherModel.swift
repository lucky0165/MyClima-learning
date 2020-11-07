//
//  WeatherModel.swift
//  MyClima-learning
//
//  Created by Łukasz Rajczewski on 07/11/2020.
//

import Foundation

struct WeatherModel: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
