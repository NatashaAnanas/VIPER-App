//
//  DetailPresenter.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 07.02.2026.
//

import UIKit

final class DetailPresenter {
    
    private let image: UIImage?
    
    // MARK: Dependencies
    
    private weak var view: DetailViewInput?
    private let interactor: DetailInteractorInput
    private let router: DetailRouterInput
    
    // MARK: Init
    
    init(view: DetailViewInput,
         interactor: DetailInteractorInput,
         router: DetailRouterInput,
         image: UIImage?) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.image = image
    }
    
    private func setupImageView() {
        if let image = self.image  {
            view?.updateView(image)
        }
    }
}

// MARK: - DetailViewOutput

extension DetailPresenter: DetailViewOutput {
    
    func viewIsReady() {
        view?.setupInitialState()
        setupImageView()
    }
}
