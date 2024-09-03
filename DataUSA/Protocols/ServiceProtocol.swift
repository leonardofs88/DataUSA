//
//  RepositoryProtocol.swift
//  DataUSA
//
//  Created by Leonardo Soares on 02/09/24.
//

import Foundation
import Combine

protocol ServiceProtocol {
    func request<T: Codable> (_ url: URL) -> AnyPublisher<T, Error>
}
