//
//  MainPresenter.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 02.02.2026.
//

import UIKit

final class MainPresenter {
    
    // MARK: - Dependencies
    
    private weak var view: MainViewInput?
    private let interactor: MainInteractorInput
    private let router: MainRouterInput
    
    // MARK: - State
    
    private var images: [String] = []
    
    // MARK: - Init
    
    init(
        view: MainViewInput,
        interactor: MainInteractorInput,
        router: MainRouterInput
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - MainViewOutput

extension MainPresenter: MainViewOutput {
    
    func viewIsReady() {
        view?.setupInitialState()
        
        interactor.fetchInfo { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let response):
                self.images = response.message
                self.view?.updateView()
            case .failure(let error):
                self.view?.showError(error.localizedDescription)
            }
        }
    }
    
    func numberOfItems() -> Int {
        images.count
    }
    
    func item(at index: Int) -> String {
        images[index]
    }
    
    func cachedImage(at index: Int) -> UIImage? {
        let url = images[index]
        return interactor.getCachedImage(for: url)
    }
    
    func fetchImage(at index: Int) {
        let url = images[index]
        
        interactor.loadImage(from: url) { [weak self] image in
            guard let self, let image else { return }
            self.view?.updateImage(image, at: index)
        }
    }
    
    func didSelectItem(at index: Int) {
        let url = images[index]
        
        if let cachedImage = interactor.getCachedImage(for: url) {
            router.push(with: cachedImage)
            return
        }
        
        interactor.loadImage(from: url) { [weak self] image in
            guard let image else { return }
            self?.router.push(with: image)
        }
    }
}
