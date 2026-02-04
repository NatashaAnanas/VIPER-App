//
//  NetworkService.swift
//  VIPER App
//
//  Created by Наталья Коновалова on 02.02.2026.
//

import Foundation

// MARK: - Errors

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case serverError(statusCode: Int)
    case underlying(Error)
}

protocol NetworkServiceProtocol {
    func request<T: Decodable>(
        urlString: String,
        completion: @escaping (Result<T, NetworkError>) -> Void
    )
}

final class NetworkService: NetworkServiceProtocol {
    
    static let shared = NetworkService()
    
    private init() {}
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = MagicNumber.x10
        config.timeoutIntervalForResource = MagicNumber.x10
        return URLSession(configuration: config)
    }()
    
    // MARK: - Request
    
    func request<T: Decodable>(
        urlString: String,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(.underlying(error)))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse,
               !(200...299).contains(httpResponse.statusCode) {
                completion(.failure(.serverError(statusCode: httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
}
