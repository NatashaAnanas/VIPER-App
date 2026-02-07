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
    
    var output: DetailViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
    }
    
    private func addAllSubviews() {
        view.addSubviews(dogImageView)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
    }
}

// MARK: - DetailViewInput

extension DetailViewController: DetailViewInput {
    
    func setupInitialState() {
        setupUI()
        addAllSubviews()
        setupConstraints()
    }
    
    func updateView(_ image: UIImage) {
        DispatchQueue.main.async {
            self.dogImageView.image = image
        }
    }
}

// MARK: - Setup Constraints

extension DetailViewController {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            dogImageView
                .topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 36),
            dogImageView
                .bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -36),
            dogImageView
                .leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            dogImageView
                .trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
}
