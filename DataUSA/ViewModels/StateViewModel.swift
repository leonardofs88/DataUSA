//
//  StateViewModel.swift
//  DataUSA
//
//  Created by Leonardo Soares on 06/10/24.
//

import Foundation
import Combine

class StateViewModel: ObservableObject {
    @Published private(set) var states: [StatePopulation] = []
    @Published private(set) var hasError = false
    
    private(set) var errorCase: (String, String) = ("","")
    
    private lazy var cancellables: Set<AnyCancellable> = []
    
    private let repository: StateRepository = DependencyContainer.stateRepository
    
    func getStatesData() {
        do {
            try repository.getPopulation()
                .receive(on: DispatchQueue.main)
                .sink { [weak self] completion in
                    guard let self else { return }
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        showError(message: error.localizedDescription)
                    }
                } receiveValue: { [weak self] response in
                    guard let self else { return }
                    states = response.data
                }.store(in: &cancellables)
        } catch {
            showError(message: error.localizedDescription)
        }
    }
    
    func hideError(message: String) {
        errorCase = ("", "")
        hasError = false
    }
    
    private func showError(message: String) {
        errorCase = ("An error has occured.", message)
        hasError = true
    }
}
