//  
//  DetailViewConfigurator.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 07.02.2026.
//

import UIKit

final class DetailViewConfigurator: NSObject {
    
    private let dependencies: DependencyContainerProtocol
    
    init(dependencies: DependencyContainerProtocol = DependencyContainer()) {
        self.dependencies = dependencies
    }
    
    func configure(image: UIImage?) -> UIViewController {
        let viewController = DetailViewController()
        
        let router = DetailRouter(transitionHandler: viewController)
        
        let interactor = DetailInteractor(
            networkService: dependencies.networkService,
            imageLoaderService: dependencies.imageLoaderService)
        
        let presenter = DetailPresenter(
            view: viewController,
            interactor: interactor,
            router: router,
            image: image
        )
        viewController.output = presenter
        
        return viewController
    }
}
