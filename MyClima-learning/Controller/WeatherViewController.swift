//
//  ViewController.swift
//  MyClima-learning
//
//  Created by Łukasz Rajczewski on 07/11/2020.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        weatherManager.delegate = self
        searchTextField.delegate = self
        
    }

    @IBAction func locationPressed(_ sender: UIButton) {
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        dealWithTextField()
    }
    
    func dealWithTextField() {
        if let cityName = searchTextField.text {
            weatherManager.fetchData(cityName)
        }
        searchTextField.endEditing(true)
    }
}

extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherData: WeatherData) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weatherData.tempString
            self.cityName.text = weatherData.cityName
            self.conditionImage.image = UIImage(systemName: weatherData.conditionName)
            self.descriptionLabel.text = weatherData.description
        }
    }
    
    
}

extension WeatherViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dealWithTextField()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchTextField.text = ""
    }
}
