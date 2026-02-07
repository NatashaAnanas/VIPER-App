//  
//  DetailInteractor.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 07.02.2026.
//

import Foundation

final class DetailInteractor: DetailInteractorInput {
    
    func fetchObject(completion: @escaping (Result<[Object], Error>) -> ()) {}
}

struct Object {
    let name: String
}
