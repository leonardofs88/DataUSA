//
//  NetworkRepository.swift
//  DataUSA
//
//  Created by Leonardo Soares on 01/09/24.
//

import Foundation
import Combine

class NetworkService: ServiceProtocol {
    func request<T: Codable>(_ url: URL) -> AnyPublisher<T, any Error> {
        return URLSession.shared
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
