//
//  WeatherManager.swift
//  MyClima-learning
//
//  Created by Łukasz Rajczewski on 07/11/2020.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherData: WeatherData)
}

struct WeatherManager {
    
    var delegate: WeatherManagerDelegate?
    
    let urlString = "https://api.openweathermap.org/data/2.5/weather?appid=a9b5f67728cfa8072bf3751c9320eb76&units=metric"
    
    func fetchData(_ cityName: String) {
        let url = "\(urlString)&q=\(cityName)"
        performRequest(url)
    }
    
    func performRequest(_ url: String) {
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                } else {
                    if let safeData = data {
                        parseJSON(safeData)
                    }
                }
            }
            task.resume()
        }
        
    }
    
    func parseJSON(_ safeData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherModel.self, from: safeData)
            let city = decodedData.name
            let temp = decodedData.main.temp
            let id = decodedData.weather[0].id
            let descrip = decodedData.weather[0].description
            
            let weatherData = WeatherData(cityName: city, temperature: temp, id: id, description: descrip)
            
            delegate?.didUpdateWeather(weatherData)
            
            
        } catch {
            print(error)
        }
    }
}
