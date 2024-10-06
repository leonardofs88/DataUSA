//
//  NetworkService.swift
//  DataUSA
//
//  Created by Leonardo Soares on 06/10/24.
//

import Combine
import Foundation

class NetworkService: NetworkServiceProtocol {
    func request<T: Codable>(_ url: URL) -> AnyPublisher<T, any Error> {
        URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { result in
                guard let httpResponse = result.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return result.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
