//
//  DependencyContainer.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 09.02.2026.
//

protocol DependencyContainerProtocol {
    var networkService: NetworkServiceProtocol { get }
    var imageLoaderService: ImageLoaderServiceProtocol { get }
}

final class DependencyContainer: DependencyContainerProtocol {
    
    lazy var networkService: NetworkServiceProtocol = {
        NetworkService()
    }()
    
    lazy var imageLoaderService: ImageLoaderServiceProtocol = {
        ImageLoaderService()
    }()
}
