//
//  WeatherInfoView.swift
//  WeatherApp
//
//  Created by Иван Доронин on 22.07.2024.
//

import UIKit

class WeatherInfoView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        insertViews()
        setupView()
        layoutViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        insertViews()
        setupView()
        layoutViews()
    }

    private func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 15
        layer.borderWidth = 1
        clipsToBounds = true
    }
    
    func insertViews() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
    
    func layoutViews() {
        titleLabel.pinLeft(to: self, 15.0)
        titleLabel.pinTop(to: self, 16.0)
        
        descriptionLabel.pinTop(to: titleLabel.bottomAnchor, 8.0)
        descriptionLabel.pinHorizontal(to: self, 16.0)
    }

    func updateContent(title: String, description: String, duration: TimeInterval = 0.3) {
        UIView.transition(with: titleLabel, duration: duration, options: [.transitionCrossDissolve, .allowUserInteraction], animations: {
            self.titleLabel.text = title
        }, completion: nil)

        UIView.transition(with: descriptionLabel, duration: duration, options: [.transitionCrossDissolve, .allowUserInteraction], animations: {
            self.descriptionLabel.text = description
        }, completion: nil)
    }
}
