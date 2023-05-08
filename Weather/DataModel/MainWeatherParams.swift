//
//  MainWeatherParams.swift
//  Weather
//
//  Created by Leandro Carvalho on 29/04/23.
//

import Foundation

// MARK: - Main Weather

struct MainWeather: Codable {
    var main: MainWeatherParams
}

struct MainWeatherParams: Codable {
    var temp: Double?
    var feels_like: Double?
    var temp_min: Double?
    var temp_max: Double?
    var pressure: Double?
    var humidity: Double?
    var sea_level: Double?
    var grnd_level: Double?
}

// MARK: - Wind Weather

struct WindWeather: Codable {
    var wind: WindWeatherParams
}

struct WindWeatherParams: Codable {
    var speed: Double?
    var deg: Double?
    var gust: Double?
}

// MARK: - Cloud Weather

struct CloudWeather: Codable {
    var clouds: CloudWeatherParams
}

struct CloudWeatherParams: Codable {
    var all: Double?
}

    
