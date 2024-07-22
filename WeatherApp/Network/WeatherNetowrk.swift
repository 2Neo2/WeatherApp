//
//  WeatherNetowrk.swift
//  WeatherApp
//
//  Created by Иван Доронин on 22.07.2024.
//

import Foundation

struct WeatherInfo {
    let title: String
    let description: String
}

protocol WeatherNetworkServiceProtocol {
    func getWeatherInfo(with emoji: String) -> WeatherInfo?
}

final class WeatherNetworkService: WeatherNetworkServiceProtocol {
    private let weatherInfoDataset: [String: WeatherInfo] = [
        "🌤️": WeatherInfo(title: "Sunny", description: "Clear sky with a lot of sunshine"),
        "⛅": WeatherInfo(title: "Partly Cloudy", description: "Partially cloudy with some sun"),
        "🌥️": WeatherInfo(title: "Cloudy", description: "Mostly cloudy with little sunshine"),
        "🌦️": WeatherInfo(title: "Showers", description: "Scattered rain showers"),
        "☁️": WeatherInfo(title: "Overcast", description: "Complete cloud cover"),
        "🌧️": WeatherInfo(title: "Rain", description: "Continuous rain showers"),
        "⛈️": WeatherInfo(title: "Thunderstorm", description: "Storm with thunder and lightning"),
        "🌩️": WeatherInfo(title: "Lightning", description: "Occasional lightning strikes"),
        "☀️": WeatherInfo(title: "Clear", description: "Clear sky"),
        "⚡": WeatherInfo(title: "Thunder", description: "Some text about thunder"),
        "❄️": WeatherInfo(title: "Snow", description: "Snowfall with accumulation"),
        "💨": WeatherInfo(title: "Windy", description: "High winds and gusts")
    ]
    
    func getWeatherInfo(with emoji: String) -> WeatherInfo? {
        return weatherInfoDataset[emoji]
    }
}
