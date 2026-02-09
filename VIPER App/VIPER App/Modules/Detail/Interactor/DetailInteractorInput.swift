//  
//  DetailInteractorInput.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 07.02.2026.
//

import UIKit

protocol DetailInteractorInput {
    
    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void)
    
    func fetchInfo(completion: @escaping (Result<RandomDogModel, NetworkError>) -> ())
}
