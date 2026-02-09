//
//  DetailViewController.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 07.02.2026.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private let dogImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()

    private let randomDogImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()

    private let randomDogButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Random Photo", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    var output: DetailViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
    }
    
    private func addAllSubviews() {
        view.addSubviews(dogImageView, randomDogButton, randomDogImageView)
    }

    private func setupUI() {
        view.backgroundColor = .white
        randomDogButton.addTarget(
            self,
            action: #selector(tapOnRandomDogButton),
            for: .touchUpInside
        )
    }
    
    @objc private func tapOnRandomDogButton() {
        output?.fetchRandomImage()
    }
}

// MARK: - DetailViewInput

extension DetailViewController: DetailViewInput {
    
    func setupInitialState() {
        setupUI()
        addAllSubviews()
        setupConstraints()
    }
    
    func updateView(image: UIImage) {
        dogImageView.image = image
    }
    
    func updateRandomImage(randomImage: UIImage) {
        randomDogImageView.image = randomImage
    }
}

// MARK: - Setup Constraints

extension DetailViewController {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            dogImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            dogImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            dogImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            dogImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            randomDogButton.topAnchor.constraint(equalTo: dogImageView.bottomAnchor, constant: 16),
            randomDogButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            randomDogButton.heightAnchor.constraint(equalToConstant: 44),
            
            randomDogImageView.topAnchor.constraint(equalTo: randomDogButton.bottomAnchor, constant: 16),
            randomDogImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            randomDogImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            randomDogImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}
