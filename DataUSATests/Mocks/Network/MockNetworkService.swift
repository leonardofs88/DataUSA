//
//  MockNetworkService.swift
//  DataUSATests
//
//  Created by Leonardo Soares on 03/09/24.
//

import Foundation
import Combine

class MockNetworkService: NetworkServiceProtocol {
    func request<T: Codable>(_ url: URL) -> AnyPublisher<T, any Error> {
        Future<T, any Error> { promise in
            do {
                let data = try Data(contentsOf: url, options: .mappedIfSafe)
                let jsonResult = try JSONDecoder().decode(T.self, from: data)
                promise(.success(jsonResult))
            } catch {
                promise(.failure(URLError(.badServerResponse)))
            }
        }.eraseToAnyPublisher()
    }
}
