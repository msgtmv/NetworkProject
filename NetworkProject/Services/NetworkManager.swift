//
//  NetworkManager.swift
//  NetworkProject
//
//  Created by Муслим Гаппаров on 3/19/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    func fetch(_ type: MainBoard.Type, withURL url: String, completion: @escaping (_ result: Result<MainBoard, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let data = try decoder.decode(MainBoard.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            } catch let error {
                print(error)
                DispatchQueue.main.async {
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
        
    }
    
    private init() {}
}
