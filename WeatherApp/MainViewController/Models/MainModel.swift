//
//  MainModel.swift
//  WeatherApp
//
//  Created by Иван Доронин on 22.07.2024.
//

import Foundation

enum MainModel {
    enum Start {
        struct Request { }
        struct Response {
            var weatherInfo: WeatherInfo
        }
        struct ViewModel {
            var title: String
            var description: String
        }
    }
    
    enum Weather {
        struct Request {
            var weatherEffect: String
        }
        struct Response {
            var weatherInfo: WeatherInfo
        }
        struct InfoViewModel {
            var title: String
            var description: String
        }
    }
}
