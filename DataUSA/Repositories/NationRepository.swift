//
//  NationRepository.swift
//  DataUSA
//
//  Created by Leonardo Soares on 06/10/24.
//

import Combine
import Foundation

class NationRepository: RepositoryProtocol {
    
    typealias T = NationData
    
    var networkService: any NetworkServiceProtocol
    
    required init(networkService: any NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getPopulation() throws -> AnyPublisher<NationData, any Error> {
        guard let url = URL(string: Endpoint.nation.fullURLString()) else { throw URLError(.badURL) }
        return networkService.request(url)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
