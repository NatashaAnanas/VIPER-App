//  
//  MainViewOutput.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 02.02.2026.
//

import UIKit

protocol MainViewOutput {
    
    func viewIsReady()
    
    func fetchImage(at index: Int)
    
    func numberOfItems() -> Int
    
    func item(at index: Int) -> String
    
    func didSelectItem(at index: Int)
    
    func cachedImage(at index: Int) -> UIImage?
}
