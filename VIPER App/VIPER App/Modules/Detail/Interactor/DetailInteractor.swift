//
//  DetailInteractor.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 07.02.2026.
//

import UIKit

final class DetailInteractor: DetailInteractorInput {
    
    private let networkService: NetworkServiceProtocol
    private let imageLoaderService: ImageLoaderServiceProtocol
    
    init(networkService: NetworkServiceProtocol,
         imageLoaderService: ImageLoaderServiceProtocol) {
        self.networkService = networkService
        self.imageLoaderService = imageLoaderService
    }
    
    func fetchInfo(completion: @escaping (Result<RandomDogModel, NetworkError>) -> ()) {
        networkService.request(urlString: Constants.randomDogImageURL)
        { (result: Result<RandomDogModel, NetworkError>) in
            switch result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        imageLoaderService.loadImage(from: urlString, completion: completion)
    }
}

private enum Constants {
    static let randomDogImageURL = "https://dog.ceo/api/breeds/image/random"
}
