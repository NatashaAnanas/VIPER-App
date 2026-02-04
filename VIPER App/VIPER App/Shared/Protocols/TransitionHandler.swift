//
//  TransitionHandler.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 04.02.2026.
//

import UIKit

protocol TransitionHandler: AnyObject {
    
    func pushView(_ viewController: UIViewController, animated: Bool)
    
    func present(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
    
    func dismiss(animated: Bool, completion: (() -> Void)?)
}
