//
//  NetworkManager.swift
//  NetworkProject
//
//  Created by Муслим Гаппаров on 3/19/24.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    func fetch(withURL url: URL, completion: @escaping (_ result: Result<MainBoard, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponce in
                switch dataResponce.result {
                case .success(let value):
                    let mainBoard = MainBoard.getMainBoard(from: value)
                    completion(.success(mainBoard))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                completion(.failure(.noData))
//                return
//            }
//            
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            
//            do {
//                let data = try decoder.decode(MainBoard.self, from: data)
//                DispatchQueue.main.async {
//                    completion(.success(data))
//                }
//            } catch let error {
//                print(error)
//                DispatchQueue.main.async {
//                    completion(.failure(.decodingError))
//                }
//            }
//        }.resume()
        
    }
    
    private init() {}
}
