//  
//  MainRouter.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 02.02.2026.
//

import UIKit

final class MainRouter: MainRouterInput {
    
    weak var transitionHandler: TransitionHandler?
    
    init(transitionHandler: TransitionHandler) {
        self.transitionHandler = transitionHandler
    }
    
    func push(with images: UIImage) {
        // тут надовызывать builder нового экрана, который возвращает новый UIViewController
        let viewController = ViewController() // это убрать
        
        viewController.modalPresentationStyle = .fullScreen
        transitionHandler?.pushView(viewController, animated: true)
    }
    
    func presentBottomSheet(_ viewController: UIViewController, height: Int) {
        if let sheet = viewController.sheetPresentationController {
            sheet.detents = [.custom(resolver: { _ in CGFloat(height) })]
            sheet.prefersGrabberVisible = true
        }
        viewController.modalPresentationStyle = .pageSheet
        transitionHandler?.present(viewController, animated: true, completion: nil)
    }
    
    func back() {
        transitionHandler?.dismiss(animated: true, completion: nil)
    }
}
