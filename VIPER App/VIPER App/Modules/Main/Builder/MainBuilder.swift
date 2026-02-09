//  
//  MainBuilder.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 02.02.2026.
//

import UIKit

final class MainViewConfigurator: NSObject {
    
    func configure() -> UIViewController {
        
        let viewController = MainViewController()
        
        let router = MainRouter(transitionHandler: viewController)
        
        let networkService = NetworkService.shared
        
        let imageLoaderService = ImageLoaderService()
        
        let interactor = MainInteractor(
            networkService: networkService,
            imageLoaderService: imageLoaderService
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
