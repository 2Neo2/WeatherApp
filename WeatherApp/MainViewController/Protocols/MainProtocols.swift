//
//  MainProtocols.swift
//  WeatherApp
//
//  Created by Иван Доронин on 22.07.2024.
//

import Foundation

protocol MainBusinessLogic {
    typealias Model = MainModel
    func loadStart(_ request: Model.Start.Request)
    func loadInfo(_ request: Model.Weather.Request)
    // func load(_ request: Model..Request)
}

protocol MainPresentationLogic {
    typealias Model = MainModel
    func presentStart(_ response: Model.Start.Response)
    func updateWeatherInfo(_ response: Model.Weather.Response)
    // func present(_ response: Model..Response)
}

protocol MainDisplayLogic: AnyObject {
    typealias Model = MainModel
    func displayStart(_ viewModel: Model.Start.ViewModel)
    func updateInfo(_ viewModel: Model.Weather.InfoViewModel)
    // func display(_ viewModel: Model..ViewModel)
}

protocol MainRoutingLogic {
    func routeTo()
}
