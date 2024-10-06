//
//  MockRouter.swift
//  DataUSATests
//
//  Created by Leonardo Soares on 03/09/24.
//

import Foundation
import Combine
@testable import DataUSA

final class MockStateRepository: RepositoryProtocol {
    typealias T = StateData
    
    var networkService: any NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getPopulation() throws -> AnyPublisher<T, any Error>{
        
        guard let url = Bundle.main.url(forResource: "DataState", withExtension: "json") else {
            throw URLError.init(.badURL)
        }
        
        return networkService.request(url)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}



