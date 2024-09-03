//
//  MockRouter.swift
//  DataUSATests
//
//  Created by Leonardo Soares on 03/09/24.
//

import Foundation

struct MockRepository: RepositoryProtocol {
    func getPopulationByStateURL(for type: MeasureType) -> URL? {
        Bundle.main.url(forResource: "Data", withExtension: "json")
    }
}
