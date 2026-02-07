//  
//  DetailRouter.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 07.02.2026.
//

import UIKit

final class DetailRouter: DetailRouterInput {

    weak var transitionHandler: TransitionHandler?

    init(transitionHandler: TransitionHandler) {
        self.transitionHandler = transitionHandler
    }
    
    func push(_ view: UIViewController) {
        view.modalPresentationStyle = .fullScreen
        transitionHandler?.pushView(view, animated: true)
    }
    
    func presentBottomSheet(_ view: UIViewController, height: Int) {
        view.modalPresentationStyle = .formSheet
        transitionHandler?.present(view, animated: true, completion: nil)
    }
    
    func popViewController() {
        transitionHandler?.dismiss(animated: true, completion: nil)
    }
}
