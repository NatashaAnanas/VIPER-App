//  
//  DetailInteractorInput.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 07.02.2026.
//

import Foundation

protocol DetailInteractorInput {
    
    func fetchObject(completion: @escaping (Result<[Object], Error>) -> ())
}
