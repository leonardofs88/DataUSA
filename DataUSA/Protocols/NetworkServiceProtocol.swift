//
//  NetworkServiceProtocol.swift
//  DataUSA
//
//  Created by Leonardo Soares on 06/10/24.
//

import Combine
import Foundation

protocol NetworkServiceProtocol {
    func request<T: Codable>(_ url: URL) -> AnyPublisher<T, any Error>
}
