//  
//  MainRouterInput.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 02.02.2026.
//

import UIKit

protocol MainRouterInput: AnyObject {
    
    func push(with images: UIImage)
    
    func presentBottomSheet(_ view: UIViewController, height: Int)
    
    func back()
}
