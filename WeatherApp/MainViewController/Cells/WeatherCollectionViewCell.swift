//
//  WeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by Иван Доронин on 22.07.2024.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: WeatherCollectionViewCell.self)
    
    private lazy var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var deleteAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        insertViews()
        setupViews()
        layoutViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(with image: UIImage) {
        weatherImageView.image = image
    }
    
    private func insertViews() {
        contentView.addSubview(weatherImageView)
    }
    
    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor
    }
    
    private func layoutViews() {
        weatherImageView.pinCenter(to: contentView)
    }
}
