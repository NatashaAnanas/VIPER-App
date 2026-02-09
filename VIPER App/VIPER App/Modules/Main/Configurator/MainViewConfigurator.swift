//  
//  MainViewConfigurator.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 02.02.2026.
//

import UIKit

final class MainViewConfigurator: NSObject {
    
    private let dependencies: DependencyContainerProtocol
    
    init(dependencies: DependencyContainerProtocol = DependencyContainer()) {
        self.dependencies = dependencies
    }
    
    func configure() -> UIViewController {
        
        let viewController = MainViewController()
        
        let router = MainRouter(transitionHandler: viewController)
        
        let interactor = MainInteractor(
            networkService: dependencies.networkService,
            imageLoaderService: dependencies.imageLoaderService
        )
        
        let presenter = MainPresenter(
            view: viewController,
            interactor: interactor,
            router: router
        )
        viewController.output = presenter
        
        return viewController
    }
}
