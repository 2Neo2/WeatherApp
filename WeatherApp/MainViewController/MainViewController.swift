//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Иван Доронин on 22.07.2024.
//

import UIKit

final class MainViewController: UIViewController,
                            MainDisplayLogic {
    // MARK: - Constants
    private enum MainConstants {
        static let fatalError: String = "init(coder:) has not been implemented"
    }
    
    // MARK: - Fields
    private let router: MainRoutingLogic
    private let interactor: MainBusinessLogic
    private let dataset: [String] = ["🌤️", "⛅", "🌥️", "🌦️", "☁️", "🌧️", "⛈️", "🌩️", "☀️", "⚡", "❄️", "💨"]
    
    private lazy var mainContentCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout { _, _ -> NSCollectionLayoutSection? in
            MainViewController.createCollectionViewLayout()
        })
        return collectionView
    }()
    
    private lazy var infoView = WeatherInfoView()

    
    // MARK: - LifeCycle
    init(
        router: MainRoutingLogic,
        interactor: MainBusinessLogic
    ) {
        self.router = router
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(MainConstants.fatalError)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        interactor.loadStart(Model.Start.Request())
    }
    
    // MARK: - Setup
    private func setupUI() {
        insertViews()
        setupViews()
        layoutViews()
    }
    
    // MARK: - Actions
    @objc
    private func wasTapped() {
        
    }
}

extension MainViewController {
    
    private func insertViews() {
        view?.addSubview(mainContentCollectionView)
        view.addSubview(infoView)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        mainContentCollectionView.delegate = self
        mainContentCollectionView.dataSource = self
        mainContentCollectionView.register(
            WeatherCollectionViewCell.self,
            forCellWithReuseIdentifier: WeatherCollectionViewCell.identifier
        )
        mainContentCollectionView.backgroundColor = .clear
    }
    
    private func layoutViews() {
        mainContentCollectionView.pinTop(to: self.view.topAnchor)
        mainContentCollectionView.pinHorizontal(to: self.view, 15)
        mainContentCollectionView.setHeight(self.view.frame.height / 2.0 - 100.0)
        
        infoView.pinTop(to: mainContentCollectionView.bottomAnchor, 15)
        infoView.pinHorizontal(to: self.view, 15)
        infoView.pinBottom(to: self.view.bottomAnchor, 15)
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataset.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: WeatherCollectionViewCell.identifier,
            for: indexPath
        ) as? WeatherCollectionViewCell else {
            return UICollectionViewCell()
        }
        let model = dataset[indexPath.row]
        
        cell.configureCell(with: model.image() ?? UIImage())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let weatherEffect = dataset[indexPath.row]
        
        interactor.loadInfo(Model.Weather.Request(weatherEffect: weatherEffect))
    }

    static func createCollectionViewLayout() -> NSCollectionLayoutSection {
        // Создаем элемент
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 15, bottom: 2, trailing: 15)
        
        // Создаем группу
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.2),
            heightDimension: .absolute(200)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        // Создаем секцию и включаем горизонтальную прокрутку
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
}

extension MainViewController {
    // MARK: - DisplayLogic
    func displayStart(_ viewModel: Model.Start.ViewModel) {
        self.infoView.updateContent(title: viewModel.title, description: viewModel.description)
    }
    
    func updateInfo(_ viewModel: Model.Weather.InfoViewModel) {
        self.infoView.updateContent(title: viewModel.title, description: viewModel.description)
    }
}
