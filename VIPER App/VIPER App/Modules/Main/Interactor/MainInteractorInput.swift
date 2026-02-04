//
//  MainInteractorInput.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 02.02.2026.
//

import UIKit

protocol MainInteractorInput {
    
    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void)
    
    func fetchInfo(completion: @escaping (Result<MainModel, NetworkError>) -> ())
    
    func getCachedImage(for urlString: String) -> UIImage?
    
    func cachedImage(from url: String) -> UIImage?
}
