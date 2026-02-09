//  
//  DetailViewInput.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 07.02.2026.
//

import UIKit

protocol DetailViewInput: AnyObject {
    
    func setupInitialState()
    
    func showInitialImage(_ image: UIImage)
    
    func showRandomImage(_ image: UIImage)
    
    func showError(_ message: String)
}
