//  
//  MainInteractor.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 02.02.2026.
//

import UIKit

final class MainInteractor: MainInteractorInput {
    
    private let networkService: NetworkServiceProtocol
    private let imageLoaderService: ImageLoaderServiceProtocol
    
    init(networkService: NetworkServiceProtocol,
         imageLoaderService: ImageLoaderServiceProtocol) {
        self.networkService = networkService
        self.imageLoaderService = imageLoaderService
    }
    
    func fetchInfo(completion: @escaping (Result<MainModel, NetworkError>) -> ()) {
        networkService.request(urlString: Constants.mainURL)
        { (result: Result<MainModel, NetworkError>) in
            switch result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getCachedImage(for urlString: String) -> UIImage? {
        imageLoaderService.getCachedImage(for: urlString)
    }
    
    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        imageLoaderService.loadImage(from: urlString, completion: completion)
    }
}

private enum Constants {
    static let mainURL = "https://dog.ceo/api/breed/hound/images"
}
