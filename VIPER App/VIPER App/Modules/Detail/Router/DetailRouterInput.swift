//  
//  DetailRouterInput.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 07.02.2026.
//

import UIKit

protocol DetailRouterInput {
    
    func push(_ view: UIViewController)
    
    func presentBottomSheet(_ view: UIViewController, height: Int)
    
    func popViewController()
}
