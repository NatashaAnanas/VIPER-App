//
//  DetailPresenter.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 07.02.2026.
//

import UIKit

final class DetailPresenter {
    
    private weak var view: DetailViewInput?
    private let interactor: DetailInteractorInput
    private let router: DetailRouterInput
    private let image: UIImage?
    
    init(
        view: DetailViewInput,
        interactor: DetailInteractorInput,
        router: DetailRouterInput,
        image: UIImage?
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.image = image
    }
}

// MARK: - DetailViewOutput

extension DetailPresenter: DetailViewOutput {
    
    func viewIsReady() {
        view?.setupInitialState()
        
        if let image {
            view?.showInitialImage(image)
        }
        fetchRandomImage()
    }
    
    func fetchRandomImage() {
        interactor.fetchInfo { [weak self] result in
            switch result {
            case .success(let model):
                self?.interactor.loadImage(from: model.message) { image in
                    guard let image else { return }
                    self?.view?.showRandomImage(image)
                }
            case .failure(let error):
                self?.view?.showError(error.localizedDescription)
            }
        }
    }
}
