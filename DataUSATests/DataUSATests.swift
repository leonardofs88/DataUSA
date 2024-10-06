//
//  DataUSATests.swift
//  DataUSATests
//
//  Created by Leonardo Soares on 01/09/24.
//

import XCTest
import Combine
@testable import DataUSA

final class DataUSATests: XCTestCase {
    lazy var cancellables: Set<AnyCancellable> = []

    func test_fetchStateData() {
        let expectations = expectation(description: #function)
        let networkService = MockNetworkService()
        let repository = MockStateRepository(networkService: networkService)
        
        var result: [StatePopulation] = []
        
        do {
            try repository.getPopulation()
                .receive(on: DispatchQueue.main)
                .sink { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        XCTFail("Should not have failed: \(error.localizedDescription)")
                    }
                } receiveValue: { response in
                    result = response.data
                    expectations.fulfill()
                }
                .store(in: &cancellables)
        } catch {
            XCTFail("Should not have failed: \(error.localizedDescription)")
        }
        
        waitForExpectations(timeout: 5)
        XCTAssertFalse(result.isEmpty)
        XCTAssert(result.first == StatePopulation(idState: "04000US01", state: "Alabama", idYear: 2022, year: "2022", population: 5028092, slugState: "alabama"))
        
        XCTAssert(result.last == StatePopulation(idState: "04000US72", state: "Puerto Rico", idYear: 2022, year: "2022", population: 3272382, slugState: "puerto-rico"))

    }
    
    func test_fetchNationData() {
        let expectations = expectation(description: #function)
        let networkService = MockNetworkService()
        let repository = MockNationRepository(networkService: networkService)
        
        var result: [Nation] = []
        
        do {
            try repository.getPopulation()
                .receive(on: DispatchQueue.main)
                .sink { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        XCTFail("Should not have failed: \(error.localizedDescription)")
                    }
                } receiveValue: { response in
                    result = response.data
                    expectations.fulfill()
                }
                .store(in: &cancellables)
        } catch {
            XCTFail("Should not have failed: \(error.localizedDescription)")
        }
        
        waitForExpectations(timeout: 5)
        XCTAssertFalse(result.isEmpty)
        XCTAssert(result.first == Nation(idNation: "01000US", nation: "United States", idYear: 2022, year: "2022", population: 331097593, slugNation: "united-states"))
        
        XCTAssert(result.last == Nation(idNation: "01000US", nation: "United States", idYear: 2013, year: "2013", population: 311536594, slugNation: "united-states"))
        
    }

}
