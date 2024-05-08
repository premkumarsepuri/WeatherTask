//
//  APIManager.swift
//  MVVM
//
//  Created by prem on 1/3/23.
//

import Foundation
import UIKit
// singleton desgin pattern
// final - interance will not work

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

//typealias Handler = (Result<[Product], DataError>) -> Void

import Foundation
protocol fetechProductDetails{
    func request<T: Codable>(
        modelType: T.Type,
        type: EndPointType,
        completion: @escaping Handler<T>
    )
}


typealias Handler<T> = (Result<T,DataError>) -> Void

final class APIManager {
    static let shared = APIManager()
    init() {}
    
    func request<T: Codable>(
        modelType: T.Type,
        type: EndPointType,
        completion: @escaping Handler<T>
    ) {
        guard let url = type.url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = type.method.rawValue
        if let parameters = type.body {
            request.httpBody = try? JSONEncoder().encode(parameters)
        }
        
        request.allHTTPHeaderFields = type.headers
       //background
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data,error == nil else {
                completion(.failure(.invalidData))
                return}
            
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            // json decoder() [] ---> array {} dictionary
            do {
                let products = try JSONDecoder().decode(modelType, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.network(error)))
            }
        }.resume()
        
    }
    
    static var commonHeaders: [String:String] {
        return [
            "Content-Type" : "application/json"
        ]
    }
}



    /*
     func fetchProduct(completion: @escaping Handler ) {
        guard let url = URL(string: Constant.API.productURL) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data,error == nil else {
                completion(.failure(.invalidData))
                return}
            
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            // json decoder() [] ---> array {} dictionary
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.network(error)))
            }
        }.resume()
    }
     /*
// Singleton - Private init
      //singleton - without private init can create object*/*/
