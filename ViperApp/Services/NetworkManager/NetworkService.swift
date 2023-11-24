//
//  NetworkService.swift
//  ViperApp
//
//  Created by Искандер Ситдиков on 12.11.2023.
//

import Foundation

enum NetworkError: Error {
    case badUrl, dataNotExist, serverError
}

protocol NetworkServiceProtocol {
    associatedtype ResponseType: Decodable
    associatedtype ErrorType: Error
    
    func getCharacter<ResponseApi: Decodable>(for type: ResponseApi.Type, completion: @escaping (Result<ResponseApi, ErrorType>) -> Void )
}

public class NetworkService: NetworkServiceProtocol {
    typealias ResponseType = AllCharactersModel
    typealias ErrorType = NetworkError
    
    func getCharacter<ResponseApi: Decodable>(for type: ResponseApi.Type, completion: @escaping (Result<ResponseApi, ErrorType>) -> Void ) {
        guard let url = NetworkConstant.makeCharacterUrl() else {
            completion(.failure(NetworkError.badUrl))
            return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            if let data = data,
                error == nil,
               let result = try? JSONDecoder().decode(ResponseApi.self, from: data) {
                completion(.success(result))
            } else {
                completion(.failure(NetworkError.dataNotExist))
            }
        }
        task.resume()
    }
    
}
