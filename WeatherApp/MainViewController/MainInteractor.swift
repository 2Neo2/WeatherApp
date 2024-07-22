//
//  MainInteractor.swift
//  WeatherApp
//
//  Created by Иван Доронин on 22.07.2024.
//

import Foundation

final class MainInteractor: MainBusinessLogic {
    // MARK: - Fields
    private let presenter: MainPresentationLogic
    private let network: WeatherNetworkService
    private let dataset: [String] = ["🌤️", "⛅", "🌥️", "🌦️", "☁️", "🌧️", "⛈️", "🌩️", "☀️", "⚡", "❄️", "💨"]
    
    // MARK: - Lifecycle
    init(presenter: MainPresentationLogic, service: WeatherNetworkService) {
        self.presenter = presenter
        self.network = service
    }
    
    // MARK: - BusinessLogic
    func loadStart(_ request: Model.Start.Request) {
        let resultModel = network.getWeatherInfo(with: dataset.randomElement() ?? "⚡")
        guard let resultModel = resultModel else { return }
        
        DispatchQueue.main.async {
            self.presenter.presentStart(Model.Start.Response(weatherInfo: resultModel))
        }
    }
    
    func loadInfo(_ request: Model.Weather.Request) {
        let resultModel = network.getWeatherInfo(with: request.weatherEffect)
        
        guard let resultModel = resultModel else { return }
        
        presenter.updateWeatherInfo(Model.Weather.Response(weatherInfo: resultModel))
    }
}
