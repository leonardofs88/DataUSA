//
//  MockNationRepository.swift
//  DataUSA
//
//  Created by Leonardo Soares on 07/10/24.
//

import Foundation
import Combine
@testable import DataUSA

final class MockNationRepository: RepositoryProtocol {
    
    typealias T = NationData
    
    var networkService: any NetworkServiceProtocol
    
    init(networkService: any NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getPopulation() throws -> AnyPublisher<NationData, any Error> {
        guard let url = Bundle.main.url(forResource: "DataNation", withExtension: "json") else {
            throw URLError.init(.badURL)
        }
        
        return networkService.request(url)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
