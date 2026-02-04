//
//  MainPresenter.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 02.02.2026.
//

import UIKit

final class MainPresenter {
    
    // MARK: Dependencies
    
    private weak var view: MainViewInput?
    private let interactor: MainInteractorInput
    private let router: MainRouterInput
    
    private var images: [String] = []
    
    // MARK: Init
    
    init(view: MainViewInput,
         interactor: MainInteractorInput,
         router: MainRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    private let dispatchGroup = DispatchGroup()
}

// MARK: - MainViewOutput

extension MainPresenter: MainViewOutput {
    
    func viewIsReady() {
        view?.setupInitialState()
        
        interactor.fetchInfo { [weak self] (result: Result<MainModel, NetworkError>) in
            guard let self else { return }
            switch result {
            case .success(let response):
                self.images = response.message
                self.view?.updateView()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchImage(at index: Int) {
        let url = images[index]
        
        if let cached = interactor.getCachedImage(for: url) {
            view?.updateImage(cached, at: index)
            return
        }
        
        interactor.loadImage(from: url) { [weak self] image in
            guard let self, let image else { return }
            self.view?.updateImage(image, at: index)
        }
    }
    
    func cachedImage(at index: Int) -> UIImage? {
        let url = images[index]
        return interactor.cachedImage(from: url)
    }
    
    func numberOfItems() -> Int {
        images.count
    }
    
    func item(at index: Int) -> String {
        images[index]
    }
    
    func didSelectItem(at index: Int) {
        let url = images[index]
        
        if let cached = interactor.getCachedImage(for: url) {
            router.push(with: cached)
            return
        }
        
        interactor.loadImage(from: url) { [weak self] image in
            guard let image else { return }
            self?.router.push(with: image)
        }
    }
}
