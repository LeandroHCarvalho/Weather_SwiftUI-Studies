//
//  Services.swift
//  Weather
//
//  Created by Leandro Carvalho on 29/04/23.
//

import Foundation

class Services {
    
    let apiID: String = "9d68284f3baded8694bd9423c79fda3a"
    
    func getWeatherData(city: String, completion: @escaping (MainWeatherParams?, WindWeatherParams?, CloudWeatherParams?)->()) {
        
        //my weather api from openWeatherMap.org
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=\(apiID)&units=imperial") else {
            completion(nil, nil, nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil, nil, nil)
                return
            }
            
            let mainResponse = try? JSONDecoder().decode(MainWeather.self, from: data)
            let windResponse = try? JSONDecoder().decode(WindWeather.self, from: data)
            let cloudResponse = try? JSONDecoder().decode(CloudWeather.self, from: data)
            
            if let mainWeatherResponse = mainResponse {
                if let windyResponse = windResponse {
                    if let cloudyResponse = cloudResponse {
                        
                        let mainWeather = mainWeatherResponse.main
                        let windyWeather = windyResponse.wind
                        let cloudyWeather = cloudyResponse.clouds
                        
                        completion(mainWeather, windyWeather, cloudyWeather)
                        
                    } else {
                        completion(nil, nil, nil)
                    }
                }
            }
        }.resume()
    }
}
