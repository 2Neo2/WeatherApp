//
//  MainPresenter.swift
//  WeatherApp
//
//  Created by Иван Доронин on 22.07.2024.
//

import Foundation

final class MainPresenter: MainPresentationLogic {
    // MARK: - Constants
    private enum Constants {
        
    }
    
    weak var view: MainDisplayLogic?
    
    // MARK: - PresentationLogic
    func presentStart(_ response: Model.Start.Response) {
        view?.displayStart(Model.Start.ViewModel(title: response.weatherInfo.title, description: response.weatherInfo.description))
    }
    
    func updateWeatherInfo(_ response: Model.Weather.Response) {
        view?.updateInfo(Model.Weather.InfoViewModel(title: response.weatherInfo.title, description: response.weatherInfo.description))
    }
}
