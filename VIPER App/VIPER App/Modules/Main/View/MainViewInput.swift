//  
//  MainViewInput.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 02.02.2026.
//

import UIKit

protocol MainViewInput: AnyObject {
    
    func setupInitialState()
    
    func updateView()
    
    func updateImage(_ image: UIImage?, at index: Int)
}
