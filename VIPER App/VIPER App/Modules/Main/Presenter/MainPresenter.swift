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
    private var loadedImages: [Int: UIImage] = [:]
    
    private let imagesQueue = DispatchQueue(label: "images.queue", attributes: .concurrent)
    
    // MARK: Init
    
    init(view: MainViewInput,
         interactor: MainInteractorInput,
         router: MainRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    private func getImage(at index: Int) -> UIImage? {
        imagesQueue.sync {
            loadedImages[index]
        }
    }
    
    private func setImage(_ image: UIImage, at index: Int) {
        imagesQueue.async(flags: .barrier) {
            self.loadedImages[index] = image
        }
    }
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
        if let cached = getImage(at: index) {
            view?.updateImage(cached, at: index)
            return
        }
        
        if let cached = interactor.getCachedImage(for: url) {
            setImage(cached, at: index)
            view?.updateImage(cached, at: index)
            return
        }
        
        interactor.loadImage(from: url) { [weak self] image in
            guard let self = self, let image = image else { return }
            self.setImage(image, at: index)
            self.view?.updateImage(image, at: index)
        }
    }
    
    func cachedImage(at index: Int) -> UIImage? {
        if let localImage = getImage(at: index) {
            return localImage
        }
        
        let url = images[index]
        if let serviceImage = interactor.getCachedImage(for: url) {
            setImage(serviceImage, at: index)
            return serviceImage
        }
        
        return nil
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
