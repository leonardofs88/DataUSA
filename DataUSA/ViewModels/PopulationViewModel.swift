//
//  PopulationViewController.swift
//  DataUSA
//
//  Created by Leonardo Soares on 02/09/24.
//

import Foundation
import Combine

class PopulationViewController {
    private let repository: RepositoryProtocol = DependencyContainer.getNetworkRepository()
    private var cancellables = Set<AnyCancellable>()
    
    private func call() -> AnyPublisher<PopulationData, Error> {
        guard let url = Router.nation.getFormatedURL(for: .population) else { return Fail(outputType: PopulationData.self, failure: URLError(.badURL)).eraseToAnyPublisher() }
        return repository.request(url)
    }
    
    func callResult() {
        call()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { result in
                print(result)
            }.store(in: &cancellables)
    }
}
