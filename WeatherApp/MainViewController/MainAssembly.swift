//
//  MainAssembly.swift
//  WeatherApp
//
//  Created by Иван Доронин on 22.07.2024.
//

import UIKit

enum MainAssembly {
    static func build() -> UIViewController {
        let router: MainRouter = MainRouter()
        let presenter: MainPresenter = MainPresenter()
        let weatherService = WeatherNetworkService()
        let interactor: MainInteractor = MainInteractor(presenter: presenter, service: weatherService)
        let viewController: MainViewController = MainViewController(
            router: router,
            interactor: interactor
        )
        
        router.view = viewController
        presenter.view = viewController
        
        return viewController
    }
}
