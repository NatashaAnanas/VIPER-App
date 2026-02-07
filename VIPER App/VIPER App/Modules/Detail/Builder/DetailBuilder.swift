//  
//  DetailBuilder.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 07.02.2026.
//

import UIKit

final class DetailViewConfigurator: NSObject {
    
    func configure(image: UIImage?) -> UIViewController {
        
        let viewController = DetailViewController()
        
        let router = DetailRouter(transitionHandler: viewController)
        
        let interactor = DetailInteractor()
        
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
