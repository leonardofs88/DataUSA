//
//  StateRepository.swift
//  DataUSA
//
//  Created by Leonardo Soares on 06/10/24.
//

import Combine
import Foundation

class StateRepository: RepositoryProtocol {
    typealias T = StateData
    
    var networkService: any NetworkServiceProtocol
    
    required init(networkService: any NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getPopulation() throws -> AnyPublisher<T, any Error> {
        guard let url = URL(string: Endpoint.state.fullURLString()) else { throw URLError(.badURL) }
        return networkService.request(url)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
