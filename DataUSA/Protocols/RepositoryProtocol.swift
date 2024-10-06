//
//  RepositoryProtocol.swift
//  DataUSA
//
//  Created by Leonardo Soares on 06/10/24.
//

import Combine

protocol RepositoryProtocol {
    associatedtype T: Codable
    var networkService: NetworkServiceProtocol { get }
    init(networkService: NetworkServiceProtocol)
    func getPopulation() throws -> AnyPublisher<T, Error>
}
