//  
//  DetailViewInput.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 07.02.2026.
//

import UIKit

protocol DetailViewInput: AnyObject {
    
    func setupInitialState()
    
    func updateView(image: UIImage)
    
    func updateRandomImage(randomImage: UIImage)
}
