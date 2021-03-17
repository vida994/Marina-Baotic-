//
//  WeatherManager.swift
//  Marina Baotić
//
//  Created by Antonio Vidakovic on 02.03.2021..
//

import UIKit

class WeatherManager {
    
    static let shared = WeatherManager()
    
    func fetchWeatherData(completion: @escaping (Result<WeatherModel, BaoticError>) -> Void) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?appid=47b346c7c81a86fd0ed06f0f39dba8fc&units=metric&q=trogir"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completion(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(WeatherData.self, from: data)
                let weather = WeatherModel(conditionId: decodedData.weather[0].id, cityName: decodedData.name, temperature: decodedData.main.temp)
                completion(.success(weather))
            }
            catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
        }
    
    func getWeather(weatherVC:WeatherView,vc: UIViewController) {
        
        WeatherManager.shared.fetchWeatherData {(result) in
            
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    weatherVC.temperatureLabel.text = "\(weather.temperatureString)º C"
                    weatherVC.conditionImage.image = UIImage(systemName: weather.conditionName)
                    
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    BaoticAlert.showAlert(on: vc, title: "There is a problem.", message: error.rawValue)
                }
                
            }
        }
    }


}
